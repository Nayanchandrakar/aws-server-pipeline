import { serve } from '@hono/node-server'
import { Hono, type Context } from 'hono'

const app = new Hono()

app.get('/', (c:Context) => {
  return c.json({message: "server is running on port 3000"})
})

serve({
  fetch: app.fetch,
  port: 3000
}, (info) => {
  console.log(`Server is running on http://localhost:${info.port}`)
})
