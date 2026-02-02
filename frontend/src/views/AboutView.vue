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
    <header class="rounded-2xl bg-slate-900 p-8 text-white">
      <h2 class="text-2xl font-bold sm:text-3xl">About Us</h2>
      <p class="mt-2 text-slate-200">Meet our team and explore our work.</p>
    </header>

    <section class="mt-8 rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
      <h3 class="text-lg font-bold text-slate-900">Our Team</h3>
      <p class="mt-2 text-slate-700">Open a member profile to see more details.</p>

      <ul class="mt-4 grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
        <li v-for="m in team" :key="m.id">
          <RouterLink
            :to="`/team/${m.id}`"
            class="block rounded-xl border border-slate-200 bg-slate-50 px-4 py-3 font-semibold text-slate-900 hover:bg-slate-100"
          >
            {{ m.name }}
          </RouterLink>
        </li>
      </ul>
      <p v-if="error" class="mt-4 text-sm text-red-700">Failed to load team: {{ error }}</p>
      <p v-else-if="loading" class="mt-4 text-sm text-slate-600">Loading…</p>

      <div class="mt-6">
        <RouterLink to="/team" class="text-sm font-semibold text-teal-700 hover:underline">
          View all team members
        </RouterLink>
      </div>
    </section>
  </div>
</template>

