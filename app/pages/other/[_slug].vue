<script setup lang="ts">
import convertDate  from '~/pages/date.js'

const route = useRoute()

console.log("route:" + route.path)
const { data: post } = await useAsyncData(() => {
  return queryCollection('blog')
    .path(route.path).first()
})

</script>

<template>
  <div v-if="post">
    <h1>{{ post.title }}</h1>
    <ContentRenderer :value="post" />
    <p>最終更新: {{ convertDate(post.date) }}</p>
  </div>
</template>

<style>
</style>