const path = require('path');
const fs = require('fs').promises; // ✅ Use Promise-based fs API
const fsSync = require('fs')


class FSHelper {
    constructor(inputPath, outputPath) {
        this.windows = [];
        this.INPUT_BASE_PATH = inputPath;
        this.OUTPUT_BASE_PATH = outputPath;
        this.INPUT_FOLDER_FILES = this.indexFiles(this.INPUT_BASE_PATH)
        
        this.FOLDER_INDEXER_STATE = null
        fs.mkdir(this.OUTPUT_BASE_PATH, { recursive: true });
    }

    changeFolder(newPath) {
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

    setFileDone(fileId) {
        this.INPUT_FOLDER_FILES[fileId]["done"] = true
    }

    getFiles() {
        
        return this.INPUT_FOLDER_FILES
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
