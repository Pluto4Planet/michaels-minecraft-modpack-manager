<template>
  <v-app>
    <Navbar />
    <v-main>
      <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script lang="js">
import Vue from "vue";
import Navbar from '@/components/Navbar';

export default Vue.extend({
  name: "App",
  components: {Navbar},
  data: () => ({
    //
  })
});
</script>
