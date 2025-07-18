<script setup lang="ts">
import type { ContentNavigationItem } from '@nuxt/content'


const route = useRoute()

console.log("route:" + route.path)

const { data } = await useAsyncData(route.path, () => {
  return queryCollectionNavigation("blog", ["draft"])
    .where("draft", "=", false)
    .where("path", "LIKE", route.path + "%")
})

useHead({
  title: data.value ? data.value[0]?.title + " | どっこと備忘録群" : "どっこと備忘録群",
})

</script>

<template>
  <div v-if="data" v-for="item in data">
    <h1>{{ item.title }}</h1>
    <div v-if="item.children" v-for="article in item.children">
      <h2 class="post-item">{{ article.title }}</h2>
        <!-- 記事一覧の生成 -->
      <ul v-if="article.children" v-for="item in article.children">
      <NuxtLink :to="item.path">
        <li>{{ item.title }}</li>
      </NuxtLink>
      </ul>
    </div>
  </div>
</template>

<style></style>