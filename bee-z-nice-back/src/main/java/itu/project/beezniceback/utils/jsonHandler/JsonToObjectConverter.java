package itu.project.beezniceback.utils.jsonHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonToObjectConverter {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    public static <T> T convertJsonToObject(String json, Class<T> valueType) {
        try {
            return objectMapper.readValue(json, valueType);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
