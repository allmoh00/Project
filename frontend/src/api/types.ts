export type PlaceSummary = {
  id: number
  slug: string
  name: string
  summary: string
  featuredImageUrl: string | null
}

export type PlaceImage = {
  url: string
  altText: string
  sortOrder: number
}

export type PlaceDetail = {
  id: number
  slug: string
  name: string
  body: string
  images: PlaceImage[]
}

export type TeamMember = {
  id: number
  name: string
  email: string
  phone: string | null
  regNo: string | null
  gender: string | null
  bio: string | null
}

export type ContactRequest = {
  name: string
  email: string
  phone?: string
  message: string
}

export type ContactResponse = {
  id: number
  status: string
}

