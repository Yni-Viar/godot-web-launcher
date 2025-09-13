const { app, BrowserWindow } = require('electron/main')
const path = require('node:path')
const express = require('express')
const server = express()
const port = 3000

server.use(express.static(path.join(__dirname, 'app')));

server.listen(port);

function createWindow () {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      sandbox: false
    }
  })

  win.removeMenu();
  
  win.loadURL('http://localhost:3000/godot.editor.html');
  //win.loadFile('godot.editor.html')
}

app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})