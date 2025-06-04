<template>
  <div class="container">
	<Header />
	<main>
	  <NuxtPage/>
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
		Footer
	}
};
</script>

<style>
.container {

  /** 左右中央 */
  margin-right: auto;
  margin-left: auto;

  max-width: 750px;
}
</style>