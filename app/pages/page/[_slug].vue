<script setup lang="ts">

import { convertFullDate } from '~/pages/date.js'

// 多分router的なやつで 画面遷移させる処理
const route = useRoute()

const { data: post } = await useAsyncData(route.path, () => {
  return queryCollection('pages')
    .path(route.path).first()
})

</script>

<template>
    <div class="content">
      <div v-if="post">
        <h1>{{ post.title }}</h1>
        <ContentRenderer :value="post" />

      </div>

    </div>

</template>

<style>
.content {

  color: black;

  h1 {
    /** position */
    margin-top: 1.6em;
    margin-bottom: 12px;

    font-size: 20px;

    a {
      text-decoration: none;
      color: inherit;
      /* 親要素のテキスト色を継承する */
    }
  }

  h2 {
    /** position */
    margin-top: 1.6em;

    font-size: 18px;

    a {
      text-decoration: none;
      color: inherit;
      /* 親要素のテキスト色を継承する */
    }

  }

  h3 {
    /** position */
    margin-top: 1.2em;

    font-size: 16px;

    a {
      text-decoration: none;
      color: inherit;
      /* 親要素のテキスト色を継承する */
    }
  }

  h4 {
    /** position */
    margin-top: 0.8em;

    font-size: 16px;

    a {
      text-decoration: none;
      color: inherit;
      /* 親要素のテキスト色を継承する */
    }
  }

  p {
    /** position */
    margin-left: 12px;

    font-size: 16px;
    line-height: 1.5em;
  }

  p code {
    padding: 4px;
    background-color: gray;
    border: 1px;
    border-radius: 5px;
    border-color: white;
    font-size: 14px;
    margin-left: 4px;
    margin-right: 4px;
  }

  pre {
    padding: 12px;
    font-size: 16px;
    line-height: 1.5em;
    background-color: white;
  }

  div {
    /** position */
    margin-left: 12px;
  }

  li {
    margin-top: 0.4em;
    margin-bottom: 0.4em;
  }

  .post-list-tag-item {
    padding: 4px;
    border: 1px;
    color: gray;
    border-radius: 5px;
    border-color: white;
    font-size: 16px;
    margin: 0px;
  }

  a {
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }
}
</style>
