<script setup lang="ts">
import Header from '~/layout/Header.vue'
import Footer from '~/layout/Footer.vue'
import convertDate from '~/pages/date.js'

const { data } = await useAsyncData(() =>
  queryCollection("posts")
    .where("draft", "=", false)
    .order("date", "DESC").all(),
);

</script>

<template>
  <div class="container">
    <Header />
    <ul v-if="data" class="post-list">
      <li v-for="article in data" :key="article.path" class="post-item">
        <!-- 記事一覧の生成 -->
        <NuxtLink :to="article.path">
          <h4 class="post-title">{{ article.title }}</h4>
          <div class="post-date">{{ convertDate(article.date) }}</div>
          <div>
          <span v-for="tag in article.tag" :key="tag" class="post-tag-item">
            {{ tag }}
          </span>


          </div>
        </NuxtLink>
      </li>
    </ul>
    <Footer />
  </div>
</template>


<style>
.container {
  /** 左右中央 */
  margin-right: auto;
  margin-left: auto;

  max-width: 750px;

  .post-list {
    padding-left: 0px;
    list-style: none;

    .post-item {
      padding: 16px;
      a {
        text-decoration: none;
      }
      .post-title {
        margin: 0;
      }
      .post-date {
        margin-top: 12px;
        font-size: 14px;
      }
      .post-tag-item {
        font-size: 12px;
        margin-right: 12px;
      }
    }
  }
}
</style>