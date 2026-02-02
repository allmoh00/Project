import type { ContactRequest, ContactResponse, PlaceDetail, PlaceSummary, TeamMember } from './types'

const API_BASE = (import.meta.env.VITE_API_BASE_URL as string | undefined) ?? 'http://localhost:8080'

async function apiFetch<T>(path: string, init?: RequestInit): Promise<T> {
  const res = await fetch(`${API_BASE}${path}`, {
    ...init,
    headers: {
      'Content-Type': 'application/json',
      ...(init?.headers ?? {}),
    },
  })

  if (!res.ok) {
    const text = await res.text().catch(() => '')
    throw new Error(`API ${res.status} ${res.statusText}${text ? `: ${text}` : ''}`)
  }

  return (await res.json()) as T
}

export function fetchPlaces(): Promise<PlaceSummary[]> {
  return apiFetch('/api/places')
}

export function fetchPlace(slug: string): Promise<PlaceDetail> {
  return apiFetch(`/api/places/${encodeURIComponent(slug)}`)
}

export function fetchTeam(): Promise<TeamMember[]> {
  return apiFetch('/api/team')
}

export function fetchTeamMember(id: number): Promise<TeamMember> {
  return apiFetch(`/api/team/${id}`)
}

export function submitContact(req: ContactRequest): Promise<ContactResponse> {
  return apiFetch('/api/contact', {
    method: 'POST',
    body: JSON.stringify(req),
  })
}

