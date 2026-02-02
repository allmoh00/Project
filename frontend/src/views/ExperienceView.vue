<script setup lang="ts">
import { RouterLink } from 'vue-router'
import ImageCarousel from '@/components/ImageCarousel.vue'

const serengeti = [
  { src: '/serengeti pic1.jpg', alt: 'Serengeti National Park' },
  { src: '/serengeti pic2.jpg', alt: 'Serengeti National Park' },
  { src: '/serengeti pic3.jpg', alt: 'Serengeti National Park' },
  { src: '/serengeti pic4.jpg', alt: 'Serengeti National Park' },
  { src: '/serengeti pic5.jpg', alt: 'Serengeti National Park' },
  { src: '/serengeti pic 6.jpg', alt: 'Serengeti National Park' },
  { src: '/serengeti pic 7.jpg', alt: 'Serengeti National Park' },
]

const kilimanjaro = [
  { src: '/kill pic1.jfif', alt: 'Mount Kilimanjaro' },
  { src: '/kill pic2.jfif', alt: 'Mount Kilimanjaro' },
  { src: '/kill pic3.jfif', alt: 'Mount Kilimanjaro' },
  { src: '/kill pic4.jfif', alt: 'Mount Kilimanjaro' },
]

const zanzibar = [
  { src: '/zanzibar pic1.webp', alt: 'Zanzibar Beach' },
  { src: '/zanzibar pic2.jpg', alt: 'Zanzibar Beach' },
  { src: '/zanzibar pc3.jpg', alt: 'Stone Town of Zanzibar' },
]

const ngorongoro = [
  { src: '/ngorongoro pic1.jfif', alt: 'Ngorongoro Crater' },
  { src: '/ngorongoro pic2.jfif', alt: 'Ngorongoro Crater' },
  { src: '/ngorongoro pic3.jfif', alt: 'Ngorongoro Crater' },
  { src: '/ngorongoro pic4.jpg', alt: 'Ngorongoro Crater' },
]
</script>

<template>
  <div class="mx-auto max-w-6xl px-4 py-10">
    <header class="rounded-2xl bg-slate-900 p-8 text-white">
      <h2 class="text-2xl font-bold sm:text-3xl">Experience</h2>
      <p class="mt-2 text-slate-200">
        Browse galleries and quick highlights for each destination.
      </p>
    </header>

    <section class="mt-8 grid gap-8">
      <div class="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
        <div class="flex flex-wrap items-baseline justify-between gap-2">
          <h3 class="text-xl font-bold text-slate-900">1. Serengeti</h3>
          <RouterLink to="/places/serengeti" class="text-sm font-semibold text-teal-700 hover:underline">
            Read more
          </RouterLink>
        </div>
        <p class="mt-2 text-slate-700">A legendary wildlife destination and home to the Great Migration.</p>
        <div class="mt-4">
          <ImageCarousel :images="serengeti" />
        </div>
      </div>

      <div class="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
        <div class="flex flex-wrap items-baseline justify-between gap-2">
          <h3 class="text-xl font-bold text-slate-900">2. Mount Kilimanjaro</h3>
          <RouterLink to="/places/kilimanjaro" class="text-sm font-semibold text-teal-700 hover:underline">
            Read more
          </RouterLink>
        </div>
        <p class="mt-2 text-slate-700">Africa’s highest peak and one of the world’s iconic treks.</p>
        <div class="mt-4">
          <ImageCarousel :images="kilimanjaro" />
        </div>
      </div>

      <div class="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
        <div class="flex flex-wrap items-baseline justify-between gap-2">
          <h3 class="text-xl font-bold text-slate-900">3. Zanzibar</h3>
          <RouterLink to="/places/zanzibar" class="text-sm font-semibold text-teal-700 hover:underline">
            Read more
          </RouterLink>
        </div>
        <p class="mt-2 text-slate-700">A tropical archipelago with beaches, history, and spice heritage.</p>
        <div class="mt-4">
          <ImageCarousel :images="zanzibar" />
        </div>
      </div>

      <div class="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
        <div class="flex flex-wrap items-baseline justify-between gap-2">
          <h3 class="text-xl font-bold text-slate-900">4. Ngorongoro Crater</h3>
          <RouterLink to="/places/ngorongoro" class="text-sm font-semibold text-teal-700 hover:underline">
            Read more
          </RouterLink>
        </div>
        <p class="mt-2 text-slate-700">A dramatic volcanic caldera with dense wildlife and deep history.</p>
        <div class="mt-4">
          <ImageCarousel :images="ngorongoro" />
        </div>
      </div>
    </section>
  </div>
</template>

