// main/index.js (or another file in main/)

const {app,BrowserWindow, ipcMain, dialog} = require('electron');
const path = require('path');
const  GeminiTranslate  = require('../models/gemini/gemini.js');


class AppView {
  
    constructor(FSHelper) {
        this.windows = [];
        this.FSHelper = FSHelper
        this.createWindow()
        this.#defineIPC()
        this.DEFAULT_MAX_WORKERS = 2
        this.DEFAULT_PROMPT = "write to stdout. Translate into flutter like code from sourced dart assembly. No code comments"
        this.DEFAULT_MODEL = "option1"
        this.MODELS_TAGS = {
            "option1" : {"TAG" : "gemini-2.5-flash", "constructor" : GeminiTranslate},
            "option2" : {"TAG" : "gemini-2.5-pro", "constructor" :   GeminiTranslate},
            "option3" : {"TAG" : "N/A", "constructor" : "N/a"},
            "option4" : {"TAG" : "N/A", "constructor" : "N/a"},
            "option5" : {"TAG" : "N/A", "constructor" : "N/a"},
        }
        this.MODEL = null
    }
    createWindow() {
        this.window = this.#createAppWindow()
        return this.window
    }

    #divideTasks(files) {
        const workersCount = this.MODEL.getWorkersCount()
        const totalFiles = files.length;
        const filesPerWorker = Math.floor(totalFiles / workersCount);
        const result = [];

        if(totalFiles <= workersCount) {
            // Handle case where there are fewer tasks than workers
            console.log("workers can handle all work singularly")
            for(let i=0; i<totalFiles; i++){
                result.push([files[i]])
                console.log(files[i])
            }
        }else{
            for (let i = 0; i < workersCount; i++) {
                if (i === workersCount - 1) {
                    // Last worker takes all remaining tasks
                    result.push(files.slice(i * filesPerWorker));
                } else {
                    result.push(files.slice(i * filesPerWorker, (i + 1) * filesPerWorker));
                }
            }
        }

        return result;
    }

    #initModel(model, workersCount, prompt, API_KEY=""){
        //either make an execution map, or switch case
        // syntax for models is model(TAG, MAX_WORKERS, PROMPT_TEMPLATE, FSHelper, API_KEY="")
        var TAG = this.MODELS_TAGS[model]["TAG"]
        this.MODEL = new this.MODELS_TAGS[model]["constructor"](TAG, workersCount, prompt, this.FSHelper, API_KEY)
    }


    #defineIPC(){
        ipcMain.handle('select-input-folder', async (event, arg) => {
            
            const result = await dialog.showOpenDialog({
                title: 'Select input folder',
                properties: ['openDirectory'],
                defaultPath: process.cwd(),
            });
            if (result.canceled) return null;
            var newPath = result.filePaths[0];
            this.FSHelper.changeFolder(newPath)
            return {
                "newPath" : newPath,
                "files" : this.FSHelper.getFiles()
            }
        });
        ipcMain.handle('select-output-folder', async (event, arg) => {
            
            const result = await dialog.showOpenDialog({
                title: 'Select output folder',
                properties: ['openDirectory'],
                defaultPath: process.cwd(),
            });
            if (result.canceled) return null;
            
            return result.filePaths[0];
        });
        ipcMain.handle('get-current-files', async (event, arg) => {
            console.log("Called")
            return {
                "path" : this.FSHelper.INPUT_BASE_PATH,
                "files" : this.FSHelper.INPUT_FOLDER_FILES
            }
        });

        ipcMain.handle('translate-files', async (event, files, model, workersCount, prompt) => {
            console.log("[translate-files] Called with: " + files.length + " file(s) for " + workersCount + " workers, using " + model)
            
            if(this.MODEL == null || this.MODEL.tag() != this.MODELS_TAGS[model]["TAG"]) {
                this.#initModel(model, workersCount, prompt)
            }else{
                this.MODEL.setPrompt(prompt)
            }
            var tasks = this.#divideTasks(files)
            this.MODEL.translate(tasks)
            return {
                "status" : true    
            }
        });
    }

    #createAppWindow() {
        const win = new BrowserWindow({
            width: 1920,
            height: 1080,
            webPreferences: {
            preload: path.join(__dirname, './preload.js'),
            nodeIntegration: true
            },
        });
        win.webContents.openDevTools({ mode: 'left' });
        win.loadFile(path.join(__dirname, '../ui/index.html')); // Load ui/index.html
        win.webContents.on('did-finish-load', () => {
            
            win.webContents.executeJavaScript(`
                document.getElementById("inputFolderPath").value = "` + this.FSHelper.INPUT_BASE_PATH + `";
                document.getElementById("outputFolderPath").value = "` + this.FSHelper.OUTPUT_BASE_PATH + `";
                document.getElementById("outputFolderPath").value = "` + this.FSHelper.OUTPUT_BASE_PATH + `";
                document.getElementById("promptTxt").value = "` + this.DEFAULT_PROMPT+ `";
                document.getElementById("maxWorkers").value = "` + this.DEFAULT_MAX_WORKERS+ `";
                document.getElementById("modelSelector").value = "` + this.DEFAULT_MODEL+ `";
                fetchFilesInit()
            `

            )
            
        });

        return win;
    }

}

module.exports = AppView;