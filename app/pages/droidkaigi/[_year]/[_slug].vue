<script setup lang="ts">
import convertDate  from '~/pages/date.js'

const route = useRoute()

console.log("route:" + route.path)
const { data: post } = await useAsyncData(() => {
  return queryCollection('blog')
    .path(route.path).first()
})

useHead({
  title: post.value?.title + " | どっこと備忘録群"
})
</script>

<template>
  <div v-if="post">
    <h1>{{ post.title }}</h1>
    <ContentRenderer :value="post" />
    <div class="last_update">
      <p>最終更新: {{ convertDate(post.date) }}</p>
    </div>
  </div>
</template>

<style>
.last_update {
  margin-top: 4.0em;
}
</style>