<template>
  <div class="root">

    <div class="container">
      <Header />
      <main>
        <div class="body_container">
          <NuxtPage class="main_container" />
        </div>
      </main>
      <Footer />
    </div>
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
.root {
  size: 100vh;
}

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

      font-size: 24px;

      border: solid 1px;
      padding: 10px;

      a {
        text-decoration: none;
        color: inherit;
        /* 親要素のテキスト色を継承する */
      }
    }

    h2 {
      /** position */
      margin-top: 2.0em;

      font-size: 20px;

      padding-bottom: 4px;
      padding-left: 10px;

      border-bottom: solid;
      border-width: 1px;
      border-color: gray;

      a {
        text-decoration: none;
        color: inherit;
        /* 親要素のテキスト色を継承する */
      }
    }

    h3 {
      /** position */
      margin-top: 1.8em;
      margin-left: 10px;

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
      margin-left: 10px;

      font-size: 14px;

      a {
        text-decoration: none;
        color: inherit;
        /* 親要素のテキスト色を継承する */
      }
    }

    p {
      /** position */
      margin: 0px 10px 16px 10px;

      font-size: 16px;
      line-height: 2.0em;
    }

    p code {
      padding: 4px;
      border-radius: 5px;
      font-size: 14px;
      margin-left: 2px;
      margin-right: 2px;

      background-color: #eee;
    }

    pre {
      line-height: 1.5em;
      margin-left: 10px;
      padding: 10px;
      overflow: auto;
      background-color: #eee;
    }

    li {
      margin-top: 0.4em;
      margin-bottom: 0.4em;

      code {
        padding: 4px;
        border-radius: 5px;
        font-size: 14px;
        margin-left: 2px;
        margin-right: 2px;

        background-color: #eee;
      }
    }
  }

  a {
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }

  table {
    /* 水平方向の中央揃え */
    margin: 0 auto;
    margin-bottom: 16px;
  }
  th {
    padding: 4px 24px 4px 24px;
  }
  td {
    padding: 4px;
  }
}
</style>
