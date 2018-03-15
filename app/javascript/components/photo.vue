<template>
  <a :href="sourceLink" target="_blank">
    <img class="photo" :id="id" :src="imageUrl" />
  </a>
</template>

<script>
  export default {
    props: {
      id: String,
      imageUrl: String,
    },

    computed: {
      sourceLink() {
        return `https://reddit.com/${this.id}`;
      },
    },
  }
</script>

<style lang="scss" scoped>
</style>
