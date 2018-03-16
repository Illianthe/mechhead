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
      axios.get('http://mechhead.test/api/photos?randomize=true')
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
  #gallery {
    display: grid;
    width: 100%;
    height: 100%;
    padding: 10px;
    box-sizing: border-box;
    grid-template: repeat(4, 1fr) / repeat(5, 1fr);
    grid-gap: 10px;
    align-items: stretch;
    justify-items: stretch;
  }
</style>
