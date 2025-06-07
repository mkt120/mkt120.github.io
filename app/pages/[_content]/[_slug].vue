<script setup lang="ts">

import { convertFullDate } from '~/pages/date.js'

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
    <div>
      <span v-for="tag in post.tag" :key="tag" class="post-list-tag-item">#{{ tag }}</span>
    </div>

  </div>

</template>

<style>
</style>
