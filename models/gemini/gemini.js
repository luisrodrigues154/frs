const { exec } = require('child_process');
const path = require('path');
const fs = require('fs');
const {ipcMain, BrowserWindow} = require('electron')



class GeminiTranslate {
  
  constructor(TAG, MAX_WORKERS, PROMPT_TEMPLATE, FSHelper, fileProcessor, API_KEY="") {
    this.windows = [];
    this.API_KEY = API_KEY;
    this.FSHelper = FSHelper
    this.MAX_WORKERS = MAX_WORKERS
    this.PROMPT_TEMPLATE = PROMPT_TEMPLATE
    this.TAG = TAG
    this.FILE_PROCESSOR = fileProcessor
  }
  
  #sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
  
  tag(){
    return this.TAG
  }

  getWorkersCount() {
    return this.MAX_WORKERS
  }
  
  setPrompt(newPrompt) {
    this.PROMPT_TEMPLATE = newPrompt
  }

  async #runTask(worker, task){
    return new Promise((resolve) => {
        console.log(`[${this.TAG} - Worker ${worker}] Starting translation for: ${task["inputPath"]}`);

        // ensure the folder exists
        fs.mkdirSync(path.dirname(task.outputPath), { recursive: true });

        // single shell command, fastest option
        const cmd = `cat ${task["inputPath"]} | gemini -m ${this.TAG} -y -p "${this.PROMPT_TEMPLATE}" > ${task["outputPath"]}`;

        exec(cmd, { shell: true }, (error, stdout, stderr) => {
            if (error) {
                console.error(`[Worker ${worker}] Error: ${error.message}`);
                return resolve(false);
            }
            console.error(`[${this.TAG} - Worker ${worker}] Translation finished for: ${task.inputPath}`);
            resolve(true);
        });
    });
        
  }


  async #start(worker, tasks) {
    var count = 0;
    var hasFailedTasks = false
    do{
      for (const task of tasks) {
        if (!task["done"]) {
          this.FILE_PROCESSOR.updateTaskStateUI(task["inputPath"], "working")
          var result = await this.#runTask(worker, {"inputPath" :task["inputPath"], "outputPath": task["inputPath"].replace(this.FSHelper.INPUT_BASE_PATH, this.FSHelper.OUTPUT_BASE_PATH)})
          
          if(result) {
            ++this.FSHelper.TOTAL_PROCESSED
            task["done"] = true
            this.FILE_PROCESSOR.updateTaskStateUI(task["inputPath"], "done")
          }else{
            hasFailedTasks = true
            this.FILE_PROCESSOR.updateTaskStateUI(task["inputPath"], "error")
          }
        }
      }
      if(hasFailedTasks){
        await this.#sleep(1000)
        ++count
      }else{
        count = 0
      }
      
    }while(hasFailedTasks && count < 3)
    console.log("[" + this.TAG + "] Worker " +  worker + " finished!!")
  }

  
  async translate(tasksSets) {
    console.log("[" + this.TAG + "] Starting translation request...")    
    
    for(var i = 0; i < this.MAX_WORKERS; i++) {
      try{
        var tasks = tasksSets[i]
        if(tasks) this.#start(i, tasks)
      }catch(e){
        console.error("[" + this.TAG + "] Error: " + e)
        return
      }
    }
  }
}

module.exports = GeminiTranslate;