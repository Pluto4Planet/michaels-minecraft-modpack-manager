<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <h1 class="display-4">Warum sind SPiegel so hässlich?</h1>
    <v-btn class="pink white--text">kys</v-btn>
    <v-btn depressed color="pink">click me</v-btn>
    <v-btn flat color="pink">click me</v-btn>
    <v-btn depressed class="pink white--text">
      <v-icon left>email</v-icon>
      <span>kys piss</span>
    </v-btn>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

@Component({
  
})
export default class Home extends Vue {}
</script>
