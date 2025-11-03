
// imports 
const {app,BrowserWindow, ipcMain, dialog} = require('electron');
const FSHelper =  require('./fshelper.js')
const WelcomeScreen = require("./ui/main/index.js")
const FileProcessingScreen = require("./ui/fileProcessing/index.js")



// app vars
var fshelper = new FSHelper(`${__dirname}/flutter_asm`, `${__dirname}/flutter_asm_out`) 
var appView;

app.whenReady().then(async () => {
  appView = new WelcomeScreen(fshelper)
});

ipcMain.handle('go-home', async (event, type) => {
  appView = new WelcomeScreen(fshelper)
});
ipcMain.handle('file-translation', async (event, type) => {
    appView = new FileProcessingScreen(fshelper)
});

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0 && !appView) appView.createWindow();
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

