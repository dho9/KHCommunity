package com.kh.app.messageBox.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.member.entity.MemberDetails;
import com.kh.app.messageBox.entity.AnonymousCheck;
import com.kh.app.messageBox.entity.MessageBox;
import com.kh.app.messageBox.entity.ReadCheck;
import com.kh.app.messageBox.service.MessageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Validated
@RequestMapping("/message")
public class MessageController {

   @Autowired
   private MessageService messageService;

   @PostMapping("/messageSend.do")
   @ResponseBody
   public ResponseEntity<?> messageSend (@RequestParam String sendId, @RequestParam String anonymousCheck,
         @RequestParam String receiveId, @RequestParam String messageContent) {

      MessageBox message = MessageBox.builder()
            .sendId(sendId)
            .receiveId(receiveId)
            .messageContent(messageContent)
            .anonymousCheck(AnonymousCheck.valueOf(anonymousCheck))
            .readCheck(ReadCheck.n)
            .build();


      int result = messageService.insertMessage(message);

      log.debug("&&&&&&&&&message / result ={} {}", message, result);

      return ResponseEntity.status(HttpStatus.OK).body(Map.of("sendId", sendId, "receiveId", receiveId));
   }


   @GetMapping("/messageList.do")
   @ResponseBody
   public List<MessageBox> data(Model model, @AuthenticationPrincipal MemberDetails member) {
      String memberId= member.getMemberId();
      List<MessageBox> messageList = messageService.getMessageList(memberId);

      model.addAttribute("messageList", messageList);

      log.debug("&&&%%%%%%%%%%%%%&&&&&&message ={}", messageList);
      return messageList;
   }


}