<script setup lang="ts">

const route = useRoute()

console.log("route:" + route.path)
const { data } = await useAsyncData(() => {
  return queryCollectionNavigation("blog", ["draft"])
    .where("draft", "=", false)
})
useHead({
  title: "どっこと備忘録群",
})

</script>

<template>
  <div v-if="data" v-for="articles in data">
    <h1>{{ articles.title }}</h1>
    <div v-if="articles.children" v-for="article in articles.children">
      <ul v-if="article.children">
        <NuxtLink :to="article.path">
          <li>{{ article.title }}</li>
        </NuxtLink>
      </ul>
      <ul v-else>
        <li class="post-item">
          <!-- 記事一覧の生成 -->
          <NuxtLink :to="article.path">
            {{ article.title }}
          </NuxtLink>
        </li>
      </ul>
    </div>
  </div>
</template>

<style></style>