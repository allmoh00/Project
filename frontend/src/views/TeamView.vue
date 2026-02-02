<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { RouterLink } from 'vue-router'
import { fetchTeam } from '@/api/client'
import type { TeamMember } from '@/api/types'

const loading = ref(true)
const error = ref<string | null>(null)
const team = ref<TeamMember[]>([])

onMounted(async () => {
  try {
    loading.value = true
    team.value = await fetchTeam()
  } catch (e) {
    error.value = e instanceof Error ? e.message : String(e)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="mx-auto max-w-6xl px-4 py-10">
    <header class="rounded-2xl bg-slate-800 p-8 text-white">
      <h2 class="text-2xl font-bold sm:text-3xl">Team</h2>
      <p class="mt-2 text-slate-200">Our project contributors.</p>
    </header>

    <section class="mt-8 grid gap-4 md:grid-cols-2 lg:grid-cols-3">
      <p v-if="error" class="lg:col-span-3 text-sm text-red-700">Failed to load team: {{ error }}</p>
      <RouterLink
        v-for="m in team"
        :key="m.id"
        :to="`/team/${m.id}`"
        class="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200 hover:shadow-md"
      >
        <div class="text-lg font-semibold text-slate-900">{{ m.name }}</div>
        <div class="mt-2 text-sm text-slate-600">{{ m.email }}</div>
        <div class="mt-3 text-sm font-semibold text-teal-700">View profile</div>
      </RouterLink>
    </section>
    <div v-if="loading" class="mt-4 text-sm text-slate-600">Loading…</div>
  </div>
</template>

