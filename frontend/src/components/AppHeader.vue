<script setup lang="ts">
import { computed, ref } from 'vue'
import { RouterLink, useRoute } from 'vue-router'

type NavItem = { label: string; to: string }

const route = useRoute()
const mobileOpen = ref(false)

const navItems: NavItem[] = [
  { label: 'Home', to: '/' },
  { label: 'Art & Culture', to: '/arts-culture' },
  { label: 'Tourist Places', to: '/tourist-places' },
  { label: 'Experience', to: '/experience' },
  { label: 'Contact Us', to: '/contact' },
  { label: 'About Us', to: '/about' },
]

const currentPath = computed(() => route.path)

function isActive(to: string) {
  if (to === '/') return currentPath.value === '/'
  return currentPath.value.startsWith(to)
}
</script>

<template>
  <header class="sticky top-0 z-50 border-b border-slate-200 bg-teal-700 text-white shadow-sm">
    <div class="mx-auto max-w-6xl px-4 py-4">
      <div class="flex items-center justify-between gap-4">
        <div class="min-w-0">
          <h1 class="truncate text-xl font-bold tracking-wide sm:text-2xl">
            Discover Tanzania Art, Culture, and Tourism
          </h1>
        </div>

        <button
          type="button"
          class="inline-flex items-center justify-center rounded-md bg-teal-800/60 px-3 py-2 text-sm font-semibold hover:bg-teal-800 focus:outline-none focus:ring-2 focus:ring-white/80 sm:hidden"
          @click="mobileOpen = !mobileOpen"
          aria-label="Toggle menu"
          :aria-expanded="mobileOpen"
        >
          ☰
        </button>
      </div>

      <nav class="mt-4 hidden rounded-lg bg-teal-800/60 px-2 py-2 sm:block">
        <ul class="flex flex-wrap items-center justify-center gap-2">
          <li v-for="item in navItems" :key="item.to">
            <RouterLink
              :to="item.to"
              class="inline-flex items-center rounded-md px-4 py-2 text-sm font-semibold text-amber-300 hover:text-white hover:bg-white/10"
              :class="isActive(item.to) ? 'bg-white/10 text-white underline underline-offset-4' : ''"
            >
              {{ item.label }}
            </RouterLink>
          </li>
        </ul>
      </nav>

      <nav v-if="mobileOpen" class="mt-4 rounded-lg bg-teal-800/60 px-2 py-2 sm:hidden">
        <ul class="flex flex-col gap-1">
          <li v-for="item in navItems" :key="item.to">
            <RouterLink
              :to="item.to"
              class="block rounded-md px-4 py-3 text-base font-semibold text-amber-300 hover:text-white hover:bg-white/10"
              :class="isActive(item.to) ? 'bg-white/10 text-white underline underline-offset-4' : ''"
              @click="mobileOpen = false"
            >
              {{ item.label }}
            </RouterLink>
          </li>
        </ul>
      </nav>
    </div>
  </header>
</template>

