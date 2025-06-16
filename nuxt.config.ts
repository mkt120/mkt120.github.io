// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  ssr: true,
  modules: [
    '@nuxt/content',
    'nuxt-gtag',
    'nuxt-github-pages'
  ],
  gtag: {
    id: 'G-676LQFY0NN',
  },
  devtools: { enabled: true },
  future: {
    compatibilityVersion: 4,
  },
  compatibilityDate: '2024-04-03',
  content: {
    build: {
      markdown: {
        highlight: {
          theme: 'github-light',
          langs : [
            'kt'
          ]
        }
      }
    }
  },
  app: {
    head : {
      meta: [
        {
          name: 'google-site-verification',
          content: 'r5A7m0wE4CUcVDI7oOvIlQK-51z-MRk9WlH0uQas7h8'
        }
      ]
    }
  }

})

// 以下が参考になりそう
// https://beyooon.jp/blog/nuxt-ssg-generate-routes-trouble/
async function route() {
  const { $content } = require('@nuxt/content');
  const dynamicRoutes = await $content('blog').fetch();
  return dynamicRoutes.map(myroute => myroute.slug === '/index' ? '/' : '/blog/' + myroute.slug);
}