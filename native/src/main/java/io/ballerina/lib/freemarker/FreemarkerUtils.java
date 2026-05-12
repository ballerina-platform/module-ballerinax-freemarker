/*
 * Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com)
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.lib.freemarker;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BString;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Locale;
import java.util.Map;

/**
 * Native implementation of the Ballerina FreeMarker module functions.
 */
public final class FreemarkerUtils {

    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();
    private static final TypeReference<Map<String, Object>> MAP_TYPE = new TypeReference<>() { };
    private static final String INLINE = "inline";
    private static final String UTF_8 = "UTF-8";
    private static final Configuration CFG = createConfiguration();

    private FreemarkerUtils() {
    }

    private static Configuration createConfiguration() {
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_33);
        cfg.setDefaultEncoding(UTF_8);
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        cfg.setLogTemplateExceptions(false);
        cfg.setClassicCompatible(true);
        cfg.setLocale(Locale.ENGLISH);
        return cfg;
    }

    /**
     * Renders a FreeMarker template string with the provided data context.
     *
     * @param template FreeMarker template as a BString
     * @param jsonData JSON string representation of the data context
     * @return Rendered string or a Ballerina error
     */
    public static Object render(BString template, BString jsonData) {
        try {
            Template tmpl = new Template(INLINE, new StringReader(template.getValue()), CFG);
            Map<String, Object> context = OBJECT_MAPPER.readValue(jsonData.getValue(), MAP_TYPE);
            StringWriter writer = new StringWriter();
            tmpl.process(context, writer);
            return StringUtils.fromString(writer.toString());
        } catch (IOException | TemplateException e) {
            return Utils.createError("Failed to render template: " + e.getMessage(), e);
        }
    }

    /**
     * Renders a FreeMarker template from a file path with the provided data context.
     *
     * @param templatePath Path to the FreeMarker template file as a BString
     * @param jsonData     JSON string representation of the data context
     * @return Rendered string or a Ballerina error
     */
    public static Object renderFromFile(BString templatePath, BString jsonData) {
        try {
            String content = Files.readString(Path.of(templatePath.getValue()));
            Template tmpl = new Template(templatePath.getValue(), new StringReader(content), CFG);
            Map<String, Object> context = OBJECT_MAPPER.readValue(jsonData.getValue(), MAP_TYPE);
            StringWriter writer = new StringWriter();
            tmpl.process(context, writer);
            return StringUtils.fromString(writer.toString());
        } catch (IOException | TemplateException e) {
            return Utils.createError("Failed to render template file: " + e.getMessage(), e);
        }
    }
}
