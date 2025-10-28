// ui/preload.js
const { contextBridge, ipcRenderer } = require('electron');

// Expose IPC APIs to the renderer process
contextBridge.exposeInMainWorld('electronAPI', {
  selectInputFolder: (message) => ipcRenderer.invoke('select-input-folder', message), 
  selectOutputFolder: (message) => ipcRenderer.invoke('select-output-folder', message),
  translateFiles: (files, model, workersCount, prompt) => ipcRenderer.invoke('translate-files', files, model, workersCount, prompt),
  getCurrentFiles: () => ipcRenderer.invoke('get-current-files' ) 
  
});