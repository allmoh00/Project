import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'node:path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  publicDir: path.resolve(__dirname, '..', 'legacy'),
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
    },
  },
})
