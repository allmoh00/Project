<script setup lang="ts">
import { computed, onMounted, ref, watch } from 'vue'
import { RouterLink } from 'vue-router'
import { fetchTeamMember } from '@/api/client'
import type { TeamMember } from '@/api/types'

const props = defineProps<{ id: string }>()

const loading = ref(true)
const error = ref<string | null>(null)
const member = ref<TeamMember | null>(null)

const memberId = computed(() => Number(props.id))

async function load() {
  try {
    loading.value = true
    error.value = null
    member.value = await fetchTeamMember(memberId.value)
  } catch (e) {
    member.value = null
    error.value = e instanceof Error ? e.message : String(e)
  } finally {
    loading.value = false
  }
}

onMounted(load)
watch(() => props.id, load)
</script>

<template>
  <div class="mx-auto max-w-3xl px-4 py-10">
    <div class="rounded-2xl bg-white p-8 shadow-sm ring-1 ring-slate-200">
      <div v-if="member">
        <h2 class="text-2xl font-bold text-slate-900">{{ member.name }}</h2>
        <div class="mt-4 grid gap-2 text-slate-700">
          <div><span class="font-semibold">Email:</span> {{ member.email }}</div>
          <div v-if="member.phone"><span class="font-semibold">Phone:</span> {{ member.phone }}</div>
          <div v-if="member.regNo"><span class="font-semibold">Registration No:</span> {{ member.regNo }}</div>
          <div v-if="member.gender"><span class="font-semibold">Gender:</span> {{ member.gender }}</div>
          <div v-if="member.bio" class="mt-2 whitespace-pre-line text-slate-700">{{ member.bio }}</div>
        </div>
      </div>

      <div v-else>
        <h2 class="text-2xl font-bold text-slate-900">
          {{ loading ? 'Loading…' : 'Team member not found' }}
        </h2>
        <p v-if="error" class="mt-3 text-sm text-red-700">Failed to load: {{ error }}</p>
      </div>

      <div class="mt-6">
        <RouterLink to="/team" class="text-sm font-semibold text-teal-700 hover:underline">← Back to Team</RouterLink>
      </div>
    </div>
  </div>
</template>

