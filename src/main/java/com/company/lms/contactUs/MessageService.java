package com.company.lms.contactUs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {
    private final MessageRepository messageRepository;

    @Autowired
    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    public List<Message> getMessages() {
        return messageRepository.findAll();
    }

    public Message getMessageById(Long id) {
        return messageRepository.findById(id).orElse(null);
    }

    public Message addMessage(Message message) {
        messageRepository.save(message);
        return message;
    }

    public Message updateMessage(Message message) {
        messageRepository.save(message);
        return message;
    }

    public String  deleteMessage(Long id) {
        if(messageRepository.existsById(id)) {
            messageRepository.deleteById(id);
            return "Deleted successfully!";
        }
        return null;
    }
}