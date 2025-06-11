<template>
  <div class="hogehogehoge">
    <iframe :src="source"
    width="100%"
    height="100%"
    />
  </div>
</template>

<script setup lang="ts">
const { url } = defineProps({
  url: {
    type: String,
    default: ''
  }
})

var src = "";
if (url.length > 0) {
    let hoge = URL.parse(url);
    let id = hoge?.searchParams.get('v');
    src = 'https://www.youtube.com/embed/' + id
}
const source = src
</script>

<style>
.hogehogehoge {
  max-width: 640px;
  aspect-ratio: 16 / 9;
}
</style>