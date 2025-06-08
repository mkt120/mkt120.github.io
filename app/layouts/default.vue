<template>
  <div class="container">
    <Header />
    <main>
      <div class="body_container">
        <NuxtPage class="main_container" />
      </div>
    </main>
    <Footer />
  </div>
</template>

<script>
import Header from "~/components/Header.vue"; // headerをインポート
import Footer from "~/components/Footer.vue"; // footerをインポート

export default {
  components: {
    Header,
    Footer,
  }
};
</script>

<style>
.container {
  /** 左右中央 */
  margin-right: auto;
  margin-left: auto;
  max-width: 1000px;

  .body_container {

    color: black;

    .main_container {
      max-width: 900px;
    }

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
      margin: 0px 4px 0px 4px;

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

    li {
      margin-top: 0.4em;
      margin-bottom: 0.4em;
    }

    a {
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }
  }

}
</style>
