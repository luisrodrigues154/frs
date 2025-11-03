const path = require('path');
const fs = require('fs').promises; 
const fsSync = require('fs')
const {dialog} = require('electron');
const AdmZip = require("adm-zip");


class FSHelper {
    constructor(inputPath, outputPath) {
        this.windows = [];
        this.INPUT_BASE_PATH = inputPath;
        this.OUTPUT_BASE_PATH = outputPath;
        this.INPUT_FOLDER_FILES = this.indexFiles(this.INPUT_BASE_PATH)
        this.FOLDER_INDEXER_STATE = null
        fs.mkdir(this.OUTPUT_BASE_PATH, { recursive: true });
    }
    changeOutputFolder(newPath) {
        this.OUTPUT_BASE_PATH = newPath
    }
    changeInputFolder(newPath) {
        console.log("CHanging path to: " + newPath)
        this.INPUT_BASE_PATH = newPath
        this.INPUT_FOLDER_FILES = this.indexFiles(this.INPUT_BASE_PATH)   
    }
    indexFiles(dir) {
        let fileList = [];
        const entries = fsSync.readdirSync(dir, { withFileTypes: true });

        for (const entry of entries) {
            const fullPath = path.join(dir, entry.name);
            if (entry.isDirectory()) {
                // Recursively index subfolder
                const subFiles = this.indexFiles(fullPath);
                fileList = fileList.concat(subFiles);
            } else if (entry.isFile()) {
                fileList.push({"inputPath" : fullPath, "done" : false});
            }
        }

        return fileList;
    }

    async getFileContent(filePath) {
        if (!filePath.startsWith(this.INPUT_BASE_PATH)) {
            filePath = path.join(this.INPUT_BASE_PATH, filePath);
        }

        try {
            return await fs.readFile(filePath, 'utf-8');
        } catch (err) {
            console.error("[FSHelper] Error reading file: " + err);
            return null;
        }
    }

    async openFSDialog(window, title, properties, filters=[], defaultPath=process.cwd()) {
        return await dialog.showOpenDialog(window, {
            title: title,
            properties: properties,
            filters: filters,
            defaultPath: defaultPath
        });
    }

    setFileDone(fileId) {
        this.INPUT_FOLDER_FILES[fileId]["done"] = true
    }

    getFiles() {
        return this.INPUT_FOLDER_FILES
    }

    #extractLibFolder(filePath, extractDir){
        fsSync.mkdirSync(extractDir, { recursive: true });
        const zip = new AdmZip(filePath);
        const zipEntries = zip.getEntries();
        var found = false
        for (const entry of zipEntries) {
            if(entry.name.endsWith(".apk")) {
                const apk = new AdmZip(entry.getData())
                for(const insideEntry of apk.getEntries()) {
                    if(insideEntry.entryName.startsWith("lib/")){
                        console.log("[FSHelper] lib/ found inside " + entry.name)
                        apk.extractEntryTo(insideEntry, extractDir, true, true);
                        found = true
                    }
                }
            }
            
        }       
        return found
    }
    
    async processAPK(filePath) {
        const ext = path.extname(filePath).toLowerCase();
        const extractDir = filePath.replace(ext, "")
        
        
        if (ext !== ".zip" && ext !== ".apk") {
            console.log(`[FSHelper] Unsupported file: ${filePath}`);
            
            return {
                "status" : false,
                "outPath" :"Unsupported file extension: " + ext
            }
        }
        
        var result = this.#extractLibFolder(filePath, extractDir)
        var status;
        var outPath;
        if(!result){
            status  = false;
            outPath = "lib folders not found in APK"
        }else{
            outPath = path.join(extractDir, "blutter_out")
            try{fsSync.mkdirSync(outPath);} catch(e) {}
        }

        return {
            "status" : result,
            "outPath" : outPath,
            "inputPath" : extractDir
        }    
      
    }

    async saveToFile(filePath, content) {
        try {
            if (!filePath.startsWith(this.INPUT_BASE_PATH)) {
                filePath = path.join(this.INPUT_BASE_PATH, filePath);
            }
            await fs.mkdir(path.dirname(filePath), { recursive: true });
            await fs.writeFile(filePath, content);

            return true;
        } catch (err) {
            console.error("[FSHelper] Error writing file:", err);
            return false;
        }
    }
}

module.exports = FSHelper;
