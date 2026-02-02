package com.example.discovertanzania.place.dto;

import java.util.List;

public final class PlaceDtos {
  private PlaceDtos() {}

  public record PlaceSummaryDto(Long id, String slug, String name, String summary, String featuredImageUrl) {}

  public record PlaceImageDto(String url, String altText, int sortOrder) {}

  public record PlaceDetailDto(Long id, String slug, String name, String body, List<PlaceImageDto> images) {}
}

