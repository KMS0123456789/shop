package com.project.shop.user.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class KakaoAccount {

    private String name; // 이름
    private Boolean hasEmail; // 이메일 존재 여부

    @JsonProperty("email") // JSON 필드와 매핑
    private String email; // 이메일

    private Boolean hasPhoneNumber; // 전화번호 존재 여부

    @JsonProperty("phone_number") // JSON 필드와 매핑
    private String phoneNumber; // 전화번호

    // Getter 및 Setter 메서드
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getHasEmail() {
        return hasEmail;
    }

    public void setHasEmail(Boolean hasEmail) {
        this.hasEmail = hasEmail;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getHasPhoneNumber() {
        return hasPhoneNumber;
    }

    public void setHasPhoneNumber(Boolean hasPhoneNumber) {
        this.hasPhoneNumber = hasPhoneNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
