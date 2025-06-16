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
  <div v-if="data" v-for="item in data">
    <h1>{{ item.title }}</h1>
    <div v-if="item.children" v-for="article in item.children">
      <div v-if="article.children">
        <h2>{{ article.title }}</h2>
        <ul v-for="a in article.children">
          <li class="post-item">
            <!-- 記事一覧の生成 -->
            <NuxtLink :to="a.path">
              <div>{{ a.title }}</div>
            </NuxtLink>
          </li>
        </ul>
      </div>
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