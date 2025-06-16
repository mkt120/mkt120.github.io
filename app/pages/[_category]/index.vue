<script setup lang="ts">

const route = useRoute()

console.log("route:" + route.path)
const { data } = await useAsyncData(() => {
  return queryCollectionNavigation("blog", ["draft"])
  .where("draft" , "=", false)
  .where("path", "LIKE", route.path + "%")
})

useHead({
  title: data.value[0].title + " | どっこと備忘録群",  
})

</script>

<template>
  <div v-if="data" v-for="item in data">
    <h1>{{ item.title }}</h1>
    <div v-if="item.children" v-for="article in item.children">
      <div v-if="article.children">
        <h3>{{ article.title }}</h3>
        <ul v-for="a in article.children">
          <li class="post-item">
            <!-- 記事一覧の生成 -->
            <NuxtLink :to="a.path">
              <div>{{ a.title }}</div>
            </NuxtLink>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<style>

</style>