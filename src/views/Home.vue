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

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
const curseforge = require("mc-curseforge-api");
const fs = require("fs");

@Component({
  data: function() {
    return {
      mods: null,
      modpackName: null,
      modpackMinecraftVersion: null,
    };
  },
  methods: {
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
      const basePath =
        "C:/Users/micha/git-repos/michaels-minecraft-modpack-manager";

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
