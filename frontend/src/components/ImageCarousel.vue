<script setup lang="ts">
import { computed, onBeforeUnmount, onMounted, ref } from 'vue'

type CarouselImage = { src: string; alt: string }

const props = withDefaults(
  defineProps<{
    images: CarouselImage[]
    autoMs?: number
  }>(),
  { autoMs: 0 },
)

const index = ref(0)
const total = computed(() => props.images.length)

const offsetStyle = computed(() => ({
  transform: `translateX(-${index.value * 100}%)`,
}))

function prev() {
  const t = total.value
  if (t === 0) return
  index.value = index.value === 0 ? t - 1 : index.value - 1
}

function next() {
  const t = total.value
  if (t === 0) return
  index.value = index.value === t - 1 ? 0 : index.value + 1
}

let timer: number | undefined
onMounted(() => {
  if (props.autoMs > 0) timer = window.setInterval(() => next(), props.autoMs)
})
onBeforeUnmount(() => {
  if (timer) window.clearInterval(timer)
})
</script>

<template>
  <div class="relative overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200">
    <div class="flex transition-transform duration-500 ease-in-out" :style="offsetStyle">
      <img
        v-for="img in images"
        :key="img.src"
        :src="img.src"
        :alt="img.alt"
        class="w-full shrink-0 object-cover"
        loading="lazy"
      />
    </div>

    <div class="absolute inset-y-0 left-0 right-0 flex items-center justify-between px-3">
      <button
        type="button"
        class="rounded-full bg-black/50 px-4 py-2 text-white hover:bg-black/70"
        @click="prev"
        aria-label="Previous"
      >
        ‹
      </button>
      <button
        type="button"
        class="rounded-full bg-black/50 px-4 py-2 text-white hover:bg-black/70"
        @click="next"
        aria-label="Next"
      >
        ›
      </button>
    </div>
  </div>
</template>

