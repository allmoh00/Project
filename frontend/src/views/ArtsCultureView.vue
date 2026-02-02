<script setup lang="ts">
import ImageCarousel from '@/components/ImageCarousel.vue'

const images = [
  { src: '/art pic 1.jpg', alt: 'Art Piece 1' },
  { src: '/art pic 2.jpg', alt: 'Art Piece 2' },
  { src: '/art pic 3.jpg', alt: 'Art Piece 3' },
  { src: '/art pic 4.jpg', alt: 'Art Piece 4' },
]
</script>

<template>
  <div class="mx-auto max-w-6xl px-4 py-10">
    <header class="rounded-2xl bg-slate-900 p-8 text-white">
      <h2 class="text-2xl font-bold sm:text-3xl">Exploring Arts and Culture</h2>
      <p class="mt-2 text-slate-200">
        Discover the beauty and creativity of different cultures through art.
      </p>
    </header>

    <section class="mt-8">
      <ImageCarousel :images="images" :auto-ms="3000" />
    </section>
  </div>
</template>

