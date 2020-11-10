<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <h1 class="display-4">Warum sind SPiegel so hässlich?</h1>
    <v-btn class="pink white--text">kys</v-btn>
    <v-btn depressed color="pink">click me</v-btn>
    <v-btn text color="pink">click me</v-btn>
    <v-btn @click="doSomething" class="pink white--text">
      <v-icon left>archive</v-icon>
      <span>Lade Mod runter</span>
    </v-btn>
    <v-btn @click="loadModpackDataFromFile" class="pink white--text">
      <v-icon left>insert_drive_file</v-icon>
      <span>Lade Modpack aus Datei</span>
    </v-btn>
    <v-btn @click="getVersion" class="pink white--text">
      Version
    </v-btn>
    <p id="version"></p>
    <p>ES FUNKTIONIERT</p>
    <p v-if="downloadProcess">{{downloadProcess}}</p>
    <dialog
     title="Application update ......"
     :visible="showUpdater"
     :close-on-click-modal="false"
     :close-on-press-escape="false"
     :show-close="false"
     width="620px"
     top="26vh"
     center>
     <template v-if="downloadProcess">
       <p>{{ 'Current:' + downloadProcess.transferred + '/ co' + downloadProcess.total}}</p>
       <el-progress :text-inside="true" :stroke-width="18" :percentage="downloadProcess.percent"></el-progress>
       <p>Downloading ({{downloadProcess.speed}}) ......</p>
     </template>
   </dialog>
   <div v-if="downloadProcess">
       <p>{{ 'Current:' + downloadProcess.transferred + '/ co' + downloadProcess.total}}</p>
       <el-progress :text-inside="true" :stroke-width="18" :percentage="downloadProcess.percent"></el-progress>
       <p>Downloading ({{downloadProcess.speed}}) ......</p>
     </div>
    <table>
      <tr>
        <th>Modpack-Name</th>
        <th>Minecraft Version</th>
      </tr>
      <tr>
        <td v-if="modpackName">{{ modpackName }}</td>
        <td v-if="modpackMinecraftVersion">{{ modpackMinecraftVersion }}</td>
      </tr>
      <tr>
        <th>Mod</th>
        <th>Beschreibung</th>
      </tr>
      <tr v-for="mod in mods" :key="mod.id">
        <td>{{ mod.name }}</td>
        <td>{{ mod.description }}</td>
      </tr>
    </table>
  </div>
</template>

<script lang="js">
import { Component, Vue } from "vue-property-decorator";
import {ipcRenderer} from "electron";
const curseforge = require("mc-curseforge-api");
const fs = require("fs");

@Component({
  data: function() {
    return {
      mods: null,
      modpackName: null,
      modpackMinecraftVersion: null,
      showUpdater: false,
      downloadProcess: null,
    };
  },
  methods: {
    created() {
      // (To allow non-Electron after the normal operation, add the judgment) only in Electron mode
      if (process.env.IS_ELECTRON) {
        const { ipcRenderer } = require('electron')
        // find the new version
        ipcRenderer.once('autoUpdater-canUpdate', (event, info) => {
          this.$confirm(`Found a new version [v${info.version}], Whether to update? `, 'prompt', {
            confirmButtonText: 'determine',
            cancelButtonText: 'cancel',
            type: 'warning'
          }).then(() => {
            ipcRenderer.send('autoUpdater-toDownload')
          })
        })
        // download progress
        ipcRenderer.on('autoUpdater-progress', (event, process) => {
          if (process.transferred >= 1024 * 1024) {
            process.transferred = (process.transferred / 1024 / 1024).toFixed(2) + 'M'
          } else {
            process.transferred = (process.transferred / 1024).toFixed(2) + 'K'
          }
          if (process.total >= 1024 * 1024) {
            process.total = (process.total / 1024 / 1024).toFixed(2) + 'M'
          } else {
            process.total = (process.total / 1024).toFixed(2) + 'K'
          }
          if (process.bytesPerSecond >= 1024 * 1024) {
            process.speed = (process.bytesPerSecond / 1024 / 1024).toFixed(2) + 'M/s'
          } else if (process.bytesPerSecond >= 1024) {
            process.speed = (process.bytesPerSecond / 1024).toFixed(2) + 'K/s'
          } else {
            process.speed = process.bytesPerSecond + 'B/s'
          }
          process.percent = process.percent.toFixed(2)
          this.downloadProcess = process
          this.showUpdater = true
        })
        // update failed to download
        ipcRenderer.once('autoUpdater-error', (event) => {
          this.$message.error('Update failed! ')
          this.showUpdater = false
        })
        // Download completed
        ipcRenderer.once('autoUpdater-downloaded', () => {
          this.$confirm('Update is complete, close the application if you install a new version? ', 'prompt', {
            confirmButtonText: 'determine',
            cancelButtonText: 'cancel',
            type: 'warning'
          }).then(() => {
            ipcRenderer.send('exit-app')
          })
        })
      }},
    getVersion: function() {
      const { ipcRenderer } = require('electron');
    const version = document.getElementById('version');
    
    ipcRenderer.send('app_version');
    ipcRenderer.on('app_version', (event, arg) => {
      ipcRenderer.removeAllListeners('app_version');
      version.innerText = 'Version ' + arg.version;
    });
    },
    loadModpackDataFromFile: function() {
      const msg = require("../../modpack.json");
      
      this.$data.modpackName = msg["modpack-name"];
      this.$data.modpackMinecraftVersion = msg["minecraft-version"];
      this.$data.mods = msg.mods;
    },
    doSomething: async function() {
      const mods = await curseforge.getMods({
        searchFilter: "random things"
      });
      //console.log(mods[0]);
      const modName = mods[0].name;
      const modId = mods[0].id;
      const modDescription = mods[0].summary;

      console.log(`modName: ${modName}`);
      console.log(`modDescription: ${modDescription}`);
      console.log(`modId: ${modId}`);

      const files = await mods[0].getFiles();
      const modFileId = files[0].id;
      const filename = files[0].download_url.split("/").pop();

      console.log(`modFileId: ${modFileId}`);
      console.log(`filename: ${filename}`);
      //const basePath = "C:/Users/micha/git-repos/michaels-minecraft-modpack-manager";
        const basePath = "D:/git-repos/michaels-minecraft-modpack-manager";

      if (!fs.existsSync(basePath + "/mods")) {
        fs.mkdirSync(basePath + "/mods");
      }

      const versions = files[0].minecraft_versions;
      console.log(`versions: ${versions}`);
      if (!fs.existsSync(basePath + "/mods/" + versions)) {
        fs.mkdirSync(basePath + "/mods/" + versions);
      }

      const path = basePath + "/mods/" + versions + "/" + filename;
      console.log(`Download path: ${path}`);
      //files[0].download(path, true);
    }
  }
})
export default class Home extends Vue {}
</script>
