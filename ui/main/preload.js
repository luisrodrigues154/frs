const { contextBridge, ipcRenderer } = require('electron');

// Expose IPC APIs to the renderer process
contextBridge.exposeInMainWorld('electronAPI', { 
  selectApk: () => ipcRenderer.invoke('select-apk' ),
  fileTranslation: () => ipcRenderer.invoke('file-translation' ) 
  
});