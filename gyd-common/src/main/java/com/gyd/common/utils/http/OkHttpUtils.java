package com.gyd.common.utils.http;

import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Component
@Slf4j
public class OkHttpUtils {




    public static String executePostRequestV2(String url, Map<String, String> headerMap, Map<String, Object> params) {
        OkHttpClient client = new OkHttpClient.Builder()
                .connectTimeout(180, TimeUnit.SECONDS)
                .readTimeout(180, TimeUnit.SECONDS)
                .writeTimeout(180, TimeUnit.SECONDS)
                .build();

        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, JSON.toJSONString(params));

        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .headers(Headers.of(headerMap))
                .build();

        try (Response response = client.newCall(request).execute()) {
            // 仅打印响应的状态码和需要的信息，避免敏感信息泄露
            log.info("OkHttpUtils-end, response status: {}", response.code());
            return response.body().string();
        } catch (IOException e) {
            // 抛出更具体的异常或记录详细的错误信息
            throw new RuntimeException("Error executing POST request", e);
        }
    }
    public String executeGetRequest(String url, Map<String, String> headerMap) {
        OkHttpClient client = new OkHttpClient().newBuilder().build();
        Request request = new Request.Builder()
                .headers(Headers.of(headerMap))
                .url(url)
                .get()
                .build();
        try (Response response = client.newCall(request).execute()) {
            // 谨慎处理日志输出，避免敏感信息泄露
            log.info("OkHttpUtils-end, response status: {}", response.code());
            return response.body().string();
        } catch (Exception e) {
            // 抛出更具体的异常或自定义异常，保留原始异常信息
            throw new HttpRequestException("Error executing GET request", e);
        }
    }

    class HttpRequestException extends RuntimeException {
        public HttpRequestException(String message, Throwable cause) {
            super(message, cause);
        }
    }

}
