<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { RouterLink } from 'vue-router'
import { fetchPlaces } from '@/api/client'
import type { PlaceSummary } from '@/api/types'

const loading = ref(true)
const error = ref<string | null>(null)
const places = ref<PlaceSummary[]>([])

onMounted(async () => {
  try {
    loading.value = true
    places.value = await fetchPlaces()
  } catch (e) {
    error.value = e instanceof Error ? e.message : String(e)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="mx-auto max-w-6xl px-4 py-10">
    <header class="rounded-2xl bg-teal-800 p-8 text-white">
      <h2 class="text-2xl font-bold sm:text-3xl">Top Tourist Places to Visit</h2>
      <p class="mt-2 text-teal-100">Browse the highlights and open any destination for more details.</p>
    </header>

    <section class="mt-8 grid gap-5 md:grid-cols-2">
      <p v-if="error" class="md:col-span-2 text-sm text-red-700">Failed to load places: {{ error }}</p>
      <RouterLink
        v-for="p in places"
        :key="p.id"
        :to="`/places/${p.slug}`"
        class="group flex gap-4 rounded-2xl bg-white p-4 shadow-sm ring-1 ring-slate-200 hover:shadow-md"
      >
        <div class="h-24 w-32 shrink-0 overflow-hidden rounded-xl bg-slate-100">
          <img
            :src="p.featuredImageUrl ?? ''"
            :alt="p.name"
            class="h-full w-full object-cover transition-transform duration-300 group-hover:scale-105"
            loading="lazy"
          />
        </div>
        <div class="min-w-0">
          <div class="text-lg font-semibold text-slate-900">{{ p.name }}</div>
          <p class="mt-1 text-sm text-slate-600">{{ p.summary }}</p>
          <div class="mt-2 text-sm font-semibold text-teal-700">See more</div>
        </div>
      </RouterLink>
    </section>
    <div v-if="loading" class="mt-4 text-sm text-slate-600">Loading…</div>
  </div>
</template>

