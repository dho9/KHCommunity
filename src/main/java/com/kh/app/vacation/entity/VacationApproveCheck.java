package com.kh.app.vacation.entity;

public enum VacationApproveCheck {
	REFUSAL("0"), // 반려
    STUDENTTOTEACHER("1"), // 학생이 휴가 제출 즉시. 
    TEACHERTOEMPLOYEE("2"), // 강사만 승인 상태
    APPROVEMENT("3"); // 최종 승인 상태

    private final String value;

    VacationApproveCheck(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
