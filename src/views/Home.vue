<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <h1 class="display-4">Warum sind SPiegel so hässlich?</h1>
    <v-btn class="pink white--text">kys</v-btn>
    <v-btn depressed color="pink">click me</v-btn>
    <v-btn text color="pink">click me</v-btn>
    <v-btn @click="doSomething" class="pink white--text">
      <v-icon left>email</v-icon>
      <span>kys piss</span>
    </v-btn>
    <p v-if="result">{{result}}</p>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
const curseforge = require("mc-curseforge-api");
const fs = require('fs');

@Component({
  data: function() {
    return {
      result: null
    };
  },
  methods: {
    doSomething: async function() {
    console.log("Button click");
    console.log("AAAAAAB");
    const mods = await curseforge.getMods({
      searchFilter: "applied energistics",
      gameVersion: "1.12.2"
    });
    //console.log(mods[0]);
    const modName = mods[0].name;
    const modDescription = mods[0].summary;
    const filename = mods[0].latestFiles[0].download_url.split("/").pop();
    const versions = mods[0].latestFiles[0].minecraft_versions;
    const modFiles = await mods[0].getFiles();
    for(let i = 0; i < modFiles.length; i++) {
      console.log(modFiles[i].minecraft_versions);
    }
    
    console.log(modName);
    console.log(modDescription);
    console.log(filename);
    //console.log(versions)
    
    const files = await mods[0].getFiles();
    
    const path = "C:/git-repos/michaels-minecraft-modpack-manager/" + filename;
    console.log(path);
    files[0].download(path, true);
    this.$data.result = mods;
    }
  }
})
export default class Home extends Vue {
}
</script>
