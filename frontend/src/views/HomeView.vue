<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { RouterLink } from 'vue-router'
import { fetchPlaces } from '@/api/client'
import type { PlaceSummary } from '@/api/types'

const loading = ref(true)
const error = ref<string | null>(null)
const featuredPlaces = ref<PlaceSummary[]>([])

onMounted(async () => {
  try {
    loading.value = true
    featuredPlaces.value = (await fetchPlaces()).slice(0, 4)
  } catch (e) {
    error.value = e instanceof Error ? e.message : String(e)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="mx-auto max-w-6xl px-4 py-10">
    <section class="rounded-2xl bg-white p-8 shadow-sm ring-1 ring-slate-200">
      <h2 class="text-2xl font-bold text-teal-800 sm:text-3xl">Discover Tanzania</h2>
      <p class="mt-3 max-w-3xl text-slate-700">
        Explore Tanzania’s rich cultural heritage and some of the most iconic tourist destinations in Africa.
      </p>
      <div class="mt-6 flex flex-wrap gap-3">
        <RouterLink
          to="/tourist-places"
          class="rounded-lg bg-teal-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-teal-800"
        >
          Browse Tourist Places
        </RouterLink>
        <RouterLink
          to="/contact"
          class="rounded-lg bg-slate-900 px-5 py-2.5 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Contact Us
        </RouterLink>
      </div>
    </section>

    <section class="mt-10">
      <h3 class="text-lg font-bold uppercase tracking-wide text-slate-800">Top Tourist Places</h3>
      <p v-if="error" class="mt-3 text-sm text-red-700">Failed to load places: {{ error }}</p>
      <div class="mt-4 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <RouterLink
          v-for="p in featuredPlaces"
          :key="p.id"
          :to="`/places/${p.slug}`"
          class="group overflow-hidden rounded-xl bg-white shadow-sm ring-1 ring-slate-200 hover:shadow-md"
        >
          <div class="aspect-[4/3] overflow-hidden bg-slate-100">
            <img
              :src="p.featuredImageUrl ?? ''"
              :alt="p.name"
              class="h-full w-full object-cover transition-transform duration-300 group-hover:scale-105"
              loading="lazy"
            />
          </div>
          <div class="p-4">
            <div class="font-semibold text-slate-900">{{ p.name }}</div>
            <div class="mt-1 text-sm text-teal-700">See more</div>
          </div>
        </RouterLink>
      </div>
      <div v-if="loading" class="mt-4 text-sm text-slate-600">Loading…</div>
    </section>
  </div>
</template>

