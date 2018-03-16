<template>
  <div id="app">
    <sidebar />
    <gallery />
  </div>
</template>

<script>
  import Sidebar from './sidebar.vue.erb';
  import Gallery from './gallery';

  export default {
    components: {
      Sidebar,
      Gallery,
    },
  }
</script>

<style lang="scss">
  @import '~normalize.css';

  #app {
    width: 100vw;
    height: 100vh;
    display: grid;
    grid-template-columns: 300px 1fr;
    grid-template-rows: 100%;
    overflow: hidden;
  }
</style>
