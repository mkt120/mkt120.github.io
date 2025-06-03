import { defineContentConfig, defineCollection, z } from '@nuxt/content'

export default defineContentConfig({
  collections: {
    posts: defineCollection({
      type: "page",
      source: "posts/**/*.md",
      schema: z.object({
        draft: z.boolean(),
        tag: z.array(z.string()),
        date: z.string(),
      }),
    }),
    android: defineCollection({
      type: "page",
      source: "posts/android/*.md",
      schema: z.object({
        draft: z.boolean(),
        tag: z.array(z.string()),
        date: z.string(),
      }),
    }),
    
    // 見つからないって怒られる。。。
    pages: defineCollection({
      type: 'page',
      source: 'pages/*.md',
      schema: z.object({
        draft: z.boolean(),
      }),
    }),
  },
})
