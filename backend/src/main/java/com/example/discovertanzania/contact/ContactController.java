package com.example.discovertanzania.contact;

import com.example.discovertanzania.contact.dto.ContactDtos.ContactRequest;
import com.example.discovertanzania.contact.dto.ContactDtos.ContactResponse;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/contact")
public class ContactController {
  private final ContactMessageRepository repository;

  public ContactController(ContactMessageRepository repository) {
    this.repository = repository;
  }

  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  public ContactResponse submit(@Valid @RequestBody ContactRequest req) {
    ContactMessage msg = new ContactMessage();
    msg.setName(req.name());
    msg.setEmail(req.email());
    msg.setPhone(req.phone());
    msg.setMessage(req.message());
    msg.setStatus("NEW");

    ContactMessage saved = repository.save(msg);
    return new ContactResponse(saved.getId(), saved.getStatus());
  }
}

