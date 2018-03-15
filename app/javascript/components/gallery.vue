<template>
  <div id="gallery">
    <photo
      v-for="item in items"
      :key="item.reddit_id"
      :id="item.reddit_id"
      :image-url="item.image_url"
    />
  </div>
</template>

<script>
  import axios from 'axios';
  import Photo from './photo';

  export default {
    components: {
      Photo,
    },

    data() {
      return {
        items: [],
      };
    },

    mounted() {
      axios.get('http://mechhead.test/api/photos')
        .then(response => {
          this.items = response.data.photos;
        })
        .catch(e => {
          console.error(e);
        });
    },
  };
</script>

<style lang="scss" scoped>
</style>
