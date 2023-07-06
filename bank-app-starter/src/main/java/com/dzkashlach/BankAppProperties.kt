package com.dzkashlach

import org.springframework.boot.context.properties.ConfigurationProperties
/*
https://www.baeldung.com/kotlin/spring-boot-configurationproperties#1-javabean-binding-option
 */
@ConfigurationProperties(prefix = "spring.dzkashlach.starter")
data class BankAppProperties(
    var id: String = "",
    var url: String = "",
    var key: String = ""
)