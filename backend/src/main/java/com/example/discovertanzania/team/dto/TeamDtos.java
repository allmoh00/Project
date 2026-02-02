package com.example.discovertanzania.team.dto;

public final class TeamDtos {
  private TeamDtos() {}

  public record TeamMemberDto(
      Long id, String name, String email, String phone, String regNo, String gender, String bio) {}
}

