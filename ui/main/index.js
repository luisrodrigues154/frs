// main/index.js (or another file in main/)

const {app,BrowserWindow, ipcMain} = require('electron');
const path = require('path');
const { spawn } = require('child_process');

class WelcomeScreen {
  
    constructor(FSHelper) {
        this.windows = [];
        this.FSHelper = FSHelper
        this.createWindow()
        this.#defineIPC()
        this.BLUTTER_ALREADY_CLONED = false
        this.BLUTTER_CMD = `python3 ${__dirname}/../../blutter/blutter.py {INPUT_PATH}/arm64-v8a {OUTPUT_PATH}`
        return this.window
        
    }
    createWindow() {
        this.window = this.#createAppWindow()
        return this.window
    }
    
    #defineIPC(){
        try{
            ipcMain.removeHandler('select-apk');
        }catch(e) {

        }
        ipcMain.handle('select-apk', async (event, arg) => {

            const apkPath = await this.FSHelper.openFSDialog(this.window, 
                'Select APK or ZIP File',
                ['openFile'],
                [{ name: 'APK or ZIP', extensions: ['apk', 'zip']}]
            );
            let result = this.#getEmptyStatus()

            let process = false;
            let selectedFile = "";
            if(!apkPath.canceled && apkPath.filePaths.length > 0){
                result["status"] = "selected"
                selectedFile = apkPath.filePaths[0]
                result["path"] = selectedFile
                process = true;
            }else{
                result["status"] = "aborted"
                result["timeout"] = true
            }
             
            this.window.webContents.executeJavaScript(` 
                updateAPKStatus(${JSON.stringify(result)})
                `)
            
            if(!process) return

            result["path"] = "Ensuring blutter"
            this.window.webContents.executeJavaScript(` 
                updateAPKStatus(${JSON.stringify(result)})
            `)
            result["path"] = selectedFile
            this.#ensureBlutter(result["path"])

            
        });
    }
    #getEmptyStatus(){
        return {
            "status" : "",
            "msg" : "",
            "path" : "", 
            "timeout" : false
        }
    }

    async #ensureBlutter(apkPath) {
        let cmd = `git clone https://github.com/worawit/blutter ${__dirname}/../../blutter`
        console.log(cmd)
        const process = spawn("sh", ["-c", cmd]);
        process.stdout.on("data", (data) => {
            console.log(`[WelcomeScreen] stdout: ${data}`);
        });

        process.stderr.on("data", (data) => {
            if(data.includes("already exists")) {
                this.BLUTTER_ALREADY_CLONED = true
                var status = this.#getEmptyStatus()
                status["status"] = "selected"
                status["msg"] = "Blutter already in base path"
                status["timeout"] = false
                this.window.webContents.executeJavaScript(` 
                    updateAPKStatus(${JSON.stringify(status)})
                `)                
            }
        });

        process.on("error", (err) => {
            reject(err);
        });
        process.on("close", (code) => {
            var status = this.#getEmptyStatus()
            console.log(`[WelcomeScreen] Blutter cloning finished, code: ${code}`);
            if (code != 0 && !this.BLUTTER_ALREADY_CLONED) {
                status["status"] = "error"
                status["msg"] = `Error cloning blutter`
                status["timeout"] = true
            }else{
                status["status"] = "success"
                status["timeout"] = false
                this.#startApkProcessing(apkPath)
            }
            this.window.webContents.executeJavaScript(` 
                updateAPKStatus(${JSON.stringify(status)})
            `)
        });


    }

    async #executeBlutter(result) {
        var cmd = this.BLUTTER_CMD.replace("{INPUT_PATH}", path.join(result["inputPath"], "lib")).replace("{OUTPUT_PATH}",  result["outPath"])
        const process = spawn("sh", ["-c", cmd]);
        
        console.log("[WelcomeScreen] Executing shell cmd: " + cmd)

        process.stdout.on("data", (data) => {
            console.log(`[WelcomeScreen] stdout: ${data}`);
        });

        process.stderr.on("data", (data) => {
            console.warn(`[WelcomeScreen] stderr: ${data}`);
        });

        process.on("error", (err) => {
            reject(err);
        });
        process.on("close", (code) => {
            var status = this.#getEmptyStatus()
            console.log(`[WelcomeScreen] Blutter command finished with code: ${code}`);
            if (code != 0) {
                status["status"] = "error"
                status["msg"] = `Command exited with code ${code}`
                status["timeout"] = true
            }else{
                status["status"] = "success"
                status["timeout"] = true
            }
            
            this.FSHelper.changeInputFolder(path.join(result["outPath"], "asm"))
            this.FSHelper.changeOutputFolder(path.join(result["outPath"], "frs_out"))
            this.window.webContents.executeJavaScript(` 
                updateAPKStatus(${JSON.stringify(status)})
            `)
        });
    }

    async #startApkProcessing(apkPath){
        
        let result = await this.FSHelper.processAPK(apkPath)
        var status = this.#getEmptyStatus()

        if(!result["status"]) {
            console.log("[WelcomeScreen] Error processing apk!")            
            status["status"] = "error"
            status["msg"] = result["outPath"]
            status["timeout"] = true
        }else{
            console.log("[WelcomeScreen] APK processed successfully!")
            status["status"] = "selected"
            status["path"] = "Executing blutter on extracted folder ..."
            status["timeout"] = false
            this.#executeBlutter(result)
        }
        this.window.webContents.executeJavaScript(` 
            updateAPKStatus(${JSON.stringify(status)})
        `)
        
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
        win.loadFile(path.join(__dirname, '../main/index.html')); // Load ui/index.html
        win.webContents.on('did-finish-load', () => {
            
            
            
        });

        return win;
    }

}

module.exports = WelcomeScreen;