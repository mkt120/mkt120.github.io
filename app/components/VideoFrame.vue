<template>
  <iframe :src="source"
  width="640"
  height="360"/>
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
