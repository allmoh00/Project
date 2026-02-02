<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { fetchTeam, submitContact } from '@/api/client'
import type { TeamMember } from '@/api/types'

const name = ref('')
const email = ref('')
const phone = ref('')
const message = ref('')

const submitting = ref(false)
const submitError = ref<string | null>(null)
const submitSuccess = ref<string | null>(null)

const teamLoading = ref(true)
const teamError = ref<string | null>(null)
const team = ref<TeamMember[]>([])

onMounted(async () => {
  try {
    teamLoading.value = true
    team.value = await fetchTeam()
  } catch (e) {
    teamError.value = e instanceof Error ? e.message : String(e)
  } finally {
    teamLoading.value = false
  }
})

async function submit() {
  submitError.value = null
  submitSuccess.value = null
  try {
    submitting.value = true
    const res = await submitContact({
      name: name.value,
      email: email.value,
      phone: phone.value || undefined,
      message: message.value,
    })
    submitSuccess.value = `Message saved (id: ${res.id}, status: ${res.status}).`
    name.value = ''
    email.value = ''
    phone.value = ''
    message.value = ''
  } catch (e) {
    submitError.value = e instanceof Error ? e.message : String(e)
  } finally {
    submitting.value = false
  }
}
</script>

<template>
  <div class="mx-auto max-w-6xl px-4 py-10">
    <header class="rounded-2xl bg-slate-800 p-8 text-white">
      <h2 class="text-2xl font-bold sm:text-3xl">Contact Us</h2>
      <p class="mt-2 text-slate-200">Get in touch with our team.</p>
    </header>

    <section class="mt-8 grid gap-4 md:grid-cols-3">
      <p v-if="teamError" class="md:col-span-3 text-sm text-red-700">Failed to load team: {{ teamError }}</p>
      <div
        v-for="m in team"
        :key="m.id"
        class="rounded-2xl bg-white p-6 text-center shadow-sm ring-1 ring-slate-200 hover:-translate-y-1 transition"
      >
        <div class="text-lg font-semibold text-slate-900">{{ m.name }}</div>
        <div v-if="m.phone" class="mt-2 text-sm text-slate-600"><span class="font-semibold">Phone:</span> {{ m.phone }}</div>
        <div class="text-sm text-slate-600"><span class="font-semibold">Email:</span> {{ m.email }}</div>
      </div>
    </section>
    <div v-if="teamLoading" class="mt-3 text-sm text-slate-600">Loading contacts…</div>

    <section class="mt-8 rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
      <h3 class="text-lg font-bold text-slate-900">Send a message</h3>
      <form class="mt-4 grid gap-4 md:grid-cols-2" @submit.prevent="submit">
        <label class="grid gap-1">
          <span class="text-sm font-semibold text-slate-700">Name</span>
          <input v-model="name" class="rounded-lg border border-slate-300 px-3 py-2" required />
        </label>

        <label class="grid gap-1">
          <span class="text-sm font-semibold text-slate-700">Email</span>
          <input v-model="email" type="email" class="rounded-lg border border-slate-300 px-3 py-2" required />
        </label>

        <label class="grid gap-1 md:col-span-2">
          <span class="text-sm font-semibold text-slate-700">Phone (optional)</span>
          <input v-model="phone" class="rounded-lg border border-slate-300 px-3 py-2" />
        </label>

        <label class="grid gap-1 md:col-span-2">
          <span class="text-sm font-semibold text-slate-700">Message</span>
          <textarea v-model="message" rows="5" class="rounded-lg border border-slate-300 px-3 py-2" required />
        </label>

        <div class="md:col-span-2">
          <button
            type="submit"
            class="rounded-lg bg-teal-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-teal-800 disabled:opacity-60"
            :disabled="submitting"
          >
            {{ submitting ? 'Submitting…' : 'Submit' }}
          </button>
        </div>

        <p v-if="submitError" class="md:col-span-2 text-sm text-red-700">Failed to submit: {{ submitError }}</p>
        <p v-if="submitSuccess" class="md:col-span-2 text-sm text-emerald-700">{{ submitSuccess }}</p>
      </form>
    </section>
  </div>
</template>

