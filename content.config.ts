import { defineContentConfig, defineCollection, z } from '@nuxt/content'

export default defineContentConfig({
  collections: {
    blog: defineCollection({
      type: "page",
      source: "**/*.md",
      schema: z.object({
        draft: z.boolean(),
        date: z.string(),
      }),
    }),    
  },
})
