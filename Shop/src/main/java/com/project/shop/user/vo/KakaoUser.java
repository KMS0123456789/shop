package com.project.shop.user.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.LinkedHashMap;
import java.util.Map;

public class KakaoUser {

    private Long id; // 카카오 아이디

    @JsonProperty("kakao_account") // JSON 필드와 매핑
    private KakaoAccount kakaoAccount; // KakaoAccount 객체

    @JsonProperty("connected_at") // JSON 필드와 매핑
    private String connectedAt; // 추가된 필드

    @JsonProperty("synched_at") // JSON 필드와 매핑
    private String synchedAt; // 추가된 필드

    private Map<String, Object> additionalProperties = new LinkedHashMap<>(); // 추가적인 속성 저장

    // Getter 및 Setter 메서드
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public KakaoAccount getKakaoAccount() {
        return kakaoAccount;
    }

    public void setKakaoAccount(KakaoAccount kakaoAccount) {
        this.kakaoAccount = kakaoAccount;
    }

    public String getConnectedAt() {
        return connectedAt;
    }

    public void setConnectedAt(String connectedAt) {
        this.connectedAt = connectedAt;
    }

    public String getSynchedAt() {
        return synchedAt;
    }

    public void setSynchedAt(String synchedAt) {
        this.synchedAt = synchedAt;
    }

    public Map<String, Object> getAdditionalProperties() {
        return additionalProperties;
    }

    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }
}
