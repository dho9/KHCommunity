package com.kh.app.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.member.service.MemberService;
import com.kh.app.notification.entity.Notification;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/header.do")
    public ResponseEntity<List<Notification>> getNotifications(@RequestParam(value = "memberId", required=false) String memberId) {
        List<Notification> notifications = memberService.getNotificationsById(memberId);
        return ResponseEntity.ok(notifications);
    }
	
	@PostMapping("/updateAlarmReadCheck.do")
	@ResponseBody
	public int updateAlarmReadCheck(@RequestParam(value = "alarmId", required=false) int alarmId) {
		int result = memberService.updateAlarmReadCheck(alarmId);
		return result;
	}

}
