const { contextBridge, ipcRenderer } = require('electron');
contextBridge.exposeInMainWorld('electronAPI', {
  downloadVideo: (url, filename, path) => ipcRenderer.send('download-video', { url, filename, path }),
  getSettings: () => ipcRenderer.invoke('get-settings'),
  saveSettings: (settings) => ipcRenderer.invoke('save-settings', settings),
  getProjects: () => ipcRenderer.invoke('get-projects'),
  saveProjects: (projects) => ipcRenderer.invoke('save-projects', projects),
  getQueue: () => ipcRenderer.invoke('get-queue'),
  saveQueue: (queue) => ipcRenderer.invoke('save-queue', queue),
  selectDownloadFolder: () => ipcRenderer.invoke('select-download-folder'),
});
