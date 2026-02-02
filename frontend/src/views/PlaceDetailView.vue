<script setup lang="ts">
import { computed, onMounted, ref, watch } from 'vue'
import { RouterLink } from 'vue-router'
import ImageCarousel from '@/components/ImageCarousel.vue'
import { fetchPlace } from '@/api/client'
import type { PlaceDetail } from '@/api/types'

const props = defineProps<{ slug: string }>()

const loading = ref(true)
const error = ref<string | null>(null)
const place = ref<PlaceDetail | null>(null)

async function load() {
  try {
    loading.value = true
    error.value = null
    place.value = await fetchPlace(props.slug)
  } catch (e) {
    place.value = null
    error.value = e instanceof Error ? e.message : String(e)
  } finally {
    loading.value = false
  }
}

onMounted(load)
watch(() => props.slug, load)

const carouselImages = computed(() =>
  (place.value?.images ?? []).map((img) => ({ src: img.url, alt: img.altText })),
)
</script>

<template>
  <div class="mx-auto max-w-5xl px-4 py-10">
    <div v-if="place" class="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200">
      <div class="p-8">
        <h2 class="text-2xl font-bold text-slate-900 sm:text-3xl">{{ place.name }}</h2>
        <p class="mt-4 whitespace-pre-line text-slate-700">{{ place.body }}</p>

        <div v-if="carouselImages.length" class="mt-6">
          <ImageCarousel :images="carouselImages" />
        </div>

        <div class="mt-8 flex flex-wrap gap-3">
          <RouterLink
            to="/tourist-places"
            class="rounded-lg bg-teal-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-teal-800"
          >
            Back to Tourist Places
          </RouterLink>
          <RouterLink
            to="/experience"
            class="rounded-lg bg-slate-900 px-5 py-2.5 text-sm font-semibold text-white hover:bg-slate-800"
          >
            See Experiences
          </RouterLink>
        </div>
      </div>
    </div>

    <div v-else class="rounded-2xl bg-white p-8 shadow-sm ring-1 ring-slate-200">
      <h2 class="text-2xl font-bold text-slate-900">
        {{ loading ? 'Loading…' : 'Place not found' }}
      </h2>
      <p v-if="error" class="mt-3 text-sm text-red-700">Failed to load: {{ error }}</p>
      <div class="mt-6">
        <RouterLink to="/tourist-places" class="text-sm font-semibold text-teal-700 hover:underline">
          ← Back to Tourist Places
        </RouterLink>
      </div>
    </div>
  </div>
</template>

