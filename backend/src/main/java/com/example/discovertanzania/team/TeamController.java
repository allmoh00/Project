package com.example.discovertanzania.team;

import com.example.discovertanzania.team.dto.TeamDtos.TeamMemberDto;
import java.util.Comparator;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api/team")
public class TeamController {
  private final TeamMemberRepository repository;

  public TeamController(TeamMemberRepository repository) {
    this.repository = repository;
  }

  @GetMapping
  public List<TeamMemberDto> list() {
    return repository.findAll().stream()
        .sorted(Comparator.comparing(TeamMember::getId))
        .map(this::toDto)
        .toList();
  }

  @GetMapping("/{id}")
  public TeamMemberDto get(@PathVariable Long id) {
    TeamMember m =
        repository
            .findById(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Team member not found"));
    return toDto(m);
  }

  private TeamMemberDto toDto(TeamMember m) {
    return new TeamMemberDto(
        m.getId(), m.getName(), m.getEmail(), m.getPhone(), m.getRegNo(), m.getGender(), m.getBio());
  }
}

