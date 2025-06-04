import { defineContentConfig, defineCollection, z } from '@nuxt/content'

export default defineContentConfig({
  collections: {
    blog: defineCollection({
      type: "page",
      source: "blog/**/*.md",
      schema: z.object({
        draft: z.boolean(),
        tag: z.array(z.string()),
        date: z.string(),
      }),
    }),
    
    pages: defineCollection({
      type: "page",
      source: "page/**/*.md",
      schema: z.object({
        draft: z.boolean(),
      }),
    }),
  },
})
