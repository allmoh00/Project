package com.example.discovertanzania.place;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PlaceRepository extends JpaRepository<Place, Long> {
  Optional<Place> findBySlug(String slug);

  @Query("select distinct p from Place p left join fetch p.images")
  List<Place> findAllWithImages();

  @Query("select p from Place p left join fetch p.images where p.slug = :slug")
  Optional<Place> findBySlugWithImages(@Param("slug") String slug);
}

