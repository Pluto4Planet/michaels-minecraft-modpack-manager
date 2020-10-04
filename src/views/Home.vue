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
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
const curseforge = require("mc-curseforge-api");

@Component({})
export default class Home extends Vue {
  doSomething = async () => {
    console.log("Button click");
    console.log("AAAAAAB");
    const mods = await curseforge.getMods({
      searchFilter: "applied energistics"
    });
    console.log(mods);
  };
}
</script>
