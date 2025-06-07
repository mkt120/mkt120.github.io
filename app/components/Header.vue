<template>
  <header>
    <div class="blog_header">
      <h2 class="blog-title">どっこと開発備忘録群</h2>
      <p>アウトプットしないとインプットできない私が Androidアプリ開発をメインとした実装方法の解説や備忘録を載せています。</p>

      <div class="tab">
        <ul>
          <li>
            <NuxtLink to="/">TOP</NuxtLink>
          </li>
          <li>
            <NuxtLink to="/other/about">About</NuxtLink>
          </li>
          <li>
            <NuxtLink to="/other/archieve">Archieve</NuxtLink>
          </li>
        </ul>
      </div>
    </div>
  </header>

</template>

<style>
.blog_header {
  margin-top: 24px;
  margin-bottom: 48px;

  h2 {
    font-size: 32px;
  }

  p {
    font-size: 16px;
    color: gray;
  }

  .tab {
    ul {
      margin-top: 24px;

      display: flex;
      list-style: none;
      padding-left: 0px;

      li {
        margin-left: auto;
        margin-right: auto;
        padding-left: 20px;
        padding-right: 20px;

        a {
          text-decoration: none;
        }

        a:hover {
          text-decoration: underline;
        }
      }
    }

  }

}
</style>
