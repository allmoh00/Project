package com.example.discovertanzania.place;

import com.example.discovertanzania.place.dto.PlaceDtos.PlaceDetailDto;
import com.example.discovertanzania.place.dto.PlaceDtos.PlaceImageDto;
import com.example.discovertanzania.place.dto.PlaceDtos.PlaceSummaryDto;
import java.util.Comparator;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api/places")
public class PlaceController {
  private final PlaceRepository placeRepository;

  public PlaceController(PlaceRepository placeRepository) {
    this.placeRepository = placeRepository;
  }

  @GetMapping
  public List<PlaceSummaryDto> list() {
    return placeRepository.findAllWithImages().stream()
        .sorted(Comparator.comparing(Place::getId))
        .map(
            p -> {
              String featured =
                  p.getImages().stream()
                      .sorted(Comparator.comparingInt(PlaceImage::getSortOrder))
                      .map(PlaceImage::getUrl)
                      .findFirst()
                      .orElse(null);
              return new PlaceSummaryDto(p.getId(), p.getSlug(), p.getName(), p.getSummary(), featured);
            })
        .toList();
  }

  @GetMapping("/{slug}")
  public PlaceDetailDto get(@PathVariable String slug) {
    Place p =
        placeRepository
            .findBySlugWithImages(slug)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Place not found"));

    List<PlaceImageDto> images =
        p.getImages().stream()
            .sorted(Comparator.comparingInt(PlaceImage::getSortOrder))
            .map(img -> new PlaceImageDto(img.getUrl(), img.getAltText(), img.getSortOrder()))
            .toList();

    return new PlaceDetailDto(p.getId(), p.getSlug(), p.getName(), p.getBody(), images);
  }
}

