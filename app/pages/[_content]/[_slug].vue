<script setup lang="ts">

import convertDate  from '~/pages/date.js'

// 多分router的なやつで 画面遷移させる処理
const route = useRoute()

const { data: post } = await useAsyncData(route.path, () => {
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
