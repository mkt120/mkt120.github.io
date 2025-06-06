
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  ssr: true,
  modules: [
    '@nuxt/content',
  ],
  devtools: { enabled: true },
  future: {
    compatibilityVersion: 4,
  },
  compatibilityDate: '2024-04-03',
})

// 以下が参考になりそう
// https://beyooon.jp/blog/nuxt-ssg-generate-routes-trouble/
async function route() {
  const { $content } = require('@nuxt/content');
  const dynamicRoutes = await $content('blog').fetch();
  return dynamicRoutes.map(myroute => myroute.slug === '/index' ? '/' : '/blog/' + myroute.slug);
}