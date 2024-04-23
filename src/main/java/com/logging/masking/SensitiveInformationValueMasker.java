package com.logging.masking;

import com.fasterxml.jackson.core.JsonStreamContext;
import com.logging.filters.ServletFilter;
import net.logstash.logback.mask.ValueMasker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Set;

public class SensitiveInformationValueMasker implements ValueMasker {


    private static final Logger log = LoggerFactory.getLogger(ValueMasker.class);

    public Set<String> unsafeWords = Set.of("pan", "token", "iban", "trxid", "rid", "card");

    final String creditCardRegex = "\\b(?:\\d[ -]*?){13,16}\\b";

    final String masked = "****-****-****-****";

    String maskMessage(String msg){
        return unsafeWords.stream()
                .map(msg::contains)
                .findAny()
                .map(it -> msg.replaceAll(creditCardRegex, masked))
                .orElse(msg);
    }

    @Override
    public Object mask(JsonStreamContext context, Object value) {
        if (value instanceof CharSequence) {
           return maskMessage((String) value);
        }
        return value;
    }
}
