package com.studentsearch.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.conversion.TypeConverter;
import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;

public class DateConverter extends DefaultTypeConverter implements TypeConverter {
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy");

    public Object convertValue(Map<String, Object> context, Object target, String propertyName, Object value, Class toType) {
        if (toType == Date.class && value instanceof String[]) {
            String[] params = (String[]) value;
            if (params.length > 0 && params[0] != null && !params[0].isEmpty()) {
                try {
                    return DATE_FORMAT.parse(params[0]);
                } catch (Exception e) {
                    throw new RuntimeException("Invalid date format for " + params[0], e);
                }
            }
        }
        return null;
    }
}