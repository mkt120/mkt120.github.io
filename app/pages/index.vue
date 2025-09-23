<script setup lang="ts">

const route = useRoute()

console.log("route:" + route.path)
const { data } = await useAsyncData(() => {
  return queryCollectionNavigation("blog", ["draft"])
    .where("draft", "=", false)
})
const android = await data.value?.find((value) => {
  return value.path.startsWith("/android")
})
const droidkaigi = await data.value?.find((value) => {
  return value.path.startsWith("/droidkaigi")
})
const nisa = await data.value?.find((value) => {
  return value.path.startsWith("/nisa")
})
const sql = await data.value?.find((value) => {
  return value.path.startsWith("/sql")
})
const other = await data.value?.find((value) => {
  return value.path.startsWith("/other")
})


useHead({
  title: "どっこと備忘録群",
})

</script>

<template>
  <!-- Android -->
  <div v-if="android">
    <h1>
      <NuxtLink :to="android.path">Android</NuxtLink>
    </h1>
    <ul v-if="android.children" v-for="article in android.children">
      <NuxtLink :to="article.path">
        <li>{{ article.title }}</li>
      </NuxtLink>
    </ul>
  </div>

  <!-- droidkaigi -->
  <div v-if="droidkaigi">
    <h1>Droidkaigi</h1>
    <div v-if="droidkaigi.children" v-for="year in droidkaigi.children">
      <NuxtLink :to="year.path">
        <h2>{{ year.title }}</h2>
      </NuxtLink>
      <ul v-if="year.children" v-for="article in year.children">
        <NuxtLink :to="article.path">
          <li>{{ article.title }}</li>
        </NuxtLink>
      </ul>
    </div>
  </div>

  <!-- SQL -->
  <div v-if="sql">
    <h1>SQL</h1>
    <ul v-if="sql.children" v-for="article in sql.children">
      <NuxtLink :to="article.path">
        <li>{{ article.title }}</li>
      </NuxtLink>
    </ul>
  </div>

  <!-- NISA -->
  <div v-if="nisa">
    <h1>NISA</h1>
    <ul v-if="nisa.children" v-for="article in nisa.children">
      <NuxtLink :to="article.path">
        <li>{{ article.title }}</li>
      </NuxtLink>
    </ul>
  </div>

  <!-- Other -->
  <div v-if="other">
    <h1>その他</h1>
    <ul v-if="other.children" v-for="article in other.children">
      <NuxtLink :to="article.path">
        <li>{{ article.title }}</li>
      </NuxtLink>
    </ul>
  </div>

</template>

<style></style>