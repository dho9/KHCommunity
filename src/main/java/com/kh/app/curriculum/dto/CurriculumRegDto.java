package com.kh.app.curriculum.dto;


import java.time.LocalDate;

import lombok.Data;

@Data
public class CurriculumRegDto {

    private String subject;
    private String curriculumName;
    private String classId;
    private String teacherId;
    private String startDateAsString; // 클라이언트에서 전송한 날짜 문자열을 저장할 필드
    private String endDateAsString; // 클라이언트에서 전송한 날짜 문자열을 저장할 필드
    private LocalDate startDate; // LocalDate로 변환된 날짜
    private LocalDate endDate; // LocalDate로 변환된 날짜
    
}
