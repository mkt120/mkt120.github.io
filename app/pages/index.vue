<script setup lang="ts">

const route = useRoute()

console.log("route:" + route.path)
const { data } = await useAsyncData(() => {
  return queryCollectionNavigation("blog", ["draft"])
  .where("draft" , "=", false)
})
</script>

<template>
  <div v-if="data" v-for="item in data">
    <h1>{{ item.title }}</h1>
    <ul v-if="item.children" v-for="article in item.children">
      <li v-if="article" :key="article.path" class="post-item">
        <!-- 記事一覧の生成 -->
        <NuxtLink :to="article.path">
          <div>{{ article.title }}</div>
        </NuxtLink>
      </li>
    </ul>
  </div>
</template>

<style>

</style>