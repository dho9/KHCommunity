package com.kh.app.oauth.service;


import java.net.URI;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;



@Service
public class KakaoServiceImpl implements KakaoService {
	
	@Value("${oauth.kakao.authorize-uri}")
	private String AUTHORIZE_URI;
	@Value("${oauth.kakao.redirect-uri}")
	private String REDIRECT_URI;
	@Value("${oauth.kakao.rest-api-key}")
	private String REST_API_KEY;
	@Value("${oauth.kakao.token-uri}")
	private String TOKEN_URI;	
	@Value("${oauth.kakao.scope}")
	private String SCOPE;
	@Value("${oauth.kakao.resource-uri-host}")
	private String RESOURCE_URI_HOST;
	
	@Override
	public String getAuthorizeUri() {
		return AUTHORIZE_URI
			+ "?redirect_uri=" + REDIRECT_URI
			+ "&response_type=code"
			+ "&client_id=" + REST_API_KEY
			+ "&scope=" + SCOPE;
	}

	
	@Override
	public Map<String, Object> getTokens(String code) {
		RestTemplate restTemplate = new RestTemplate();
		// 요청 header, 사용자입력값
		HttpHeaders httpHeaders = new HttpHeaders();
		HttpEntity<HttpHeaders> httpEntity = new HttpEntity<>(httpHeaders);
		
		String uri = TOKEN_URI
				   + "?grant_type=authorization_code"
				   + "&client_id=" + REST_API_KEY
				   + "&redirect_uri=" + REDIRECT_URI
				   + "&code=" + code;
		ResponseEntity<?> responseEntity = 
				 restTemplate.exchange(URI.create(uri), HttpMethod.GET, httpEntity, Map.class);
		return (Map<String, Object>) responseEntity.getBody();
	}


	@Override
	public Map<String, Object> getProfile(String accessToken) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setBearerAuth(accessToken);
		HttpEntity<HttpHeaders> httpEntity = new HttpEntity<>(httpHeaders);
		String uri = RESOURCE_URI_HOST + "/v2/user/me";
		ResponseEntity<Map<String, Object>> responseEntity = 
				restTemplate.exchange(
						URI.create(uri), 
						HttpMethod.GET, 
						httpEntity, 
						new ParameterizedTypeReference<Map<String, Object>>(){});
		
		return responseEntity.getBody();
	}
	
	
}