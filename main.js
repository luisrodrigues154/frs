
// imports 
const {app, ipcMain, dialog} = require('electron');
const FSHelper =  require('./fshelper.js')
const AppView = require("./ui/index.js")

// app vars
var fshelper = new FSHelper(`${__dirname}/flutter_asm`, `${__dirname}/flutter_asm_out`) 
var appView;

app.whenReady().then(async () => {
  appView = new AppView(fshelper)
  
});


app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) createAppWindow();
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

