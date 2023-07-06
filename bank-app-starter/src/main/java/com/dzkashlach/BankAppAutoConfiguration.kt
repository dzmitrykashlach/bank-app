package com.dzkashlach

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.http.SessionCreationPolicy
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter
import org.springframework.security.web.SecurityFilterChain
import org.springframework.security.web.csrf.CookieCsrfTokenRepository
import org.springframework.web.cors.CorsConfiguration

@Configuration
@EnableConfigurationProperties(BankAppProperties::class)
open class BankAppAutoConfiguration(
    @Autowired val bankAppProperties:BankAppProperties
) {

    @Bean
    @ConditionalOnMissingBean
    open fun bankProperties(): BankAppProperties {
        return BankAppProperties()
    }


    @Bean
    @Throws(Exception::class)
    open fun defaultSecurityFilterChain(http: HttpSecurity): SecurityFilterChain? {
        val jwtAuthenticationConverter = JwtAuthenticationConverter()
        jwtAuthenticationConverter.setJwtGrantedAuthoritiesConverter(KeycloakRoleConverter())
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
            .cors().configurationSource {
                val config = CorsConfiguration()
                config.setAllowedOrigins(listOf("http://localhost:4200"))
                config.setAllowedMethods(listOf("*"))
                config.setAllowCredentials(true)
                config.setAllowedHeaders(listOf("*"))
                config.setExposedHeaders(mutableListOf("Authorization"))
                config.setMaxAge(3600L)
                config
            }.and().csrf().ignoringRequestMatchers("/contact", "/register")
            .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
            .and().authorizeHttpRequests()
            .requestMatchers("/myAccount").hasRole("USER")
            .requestMatchers("/myBalance").hasAnyRole("USER", "ADMIN")
            .requestMatchers("/myLoans").authenticated()
            .requestMatchers("/myCards").hasRole("USER")
            .requestMatchers("/user").authenticated()
            .requestMatchers("/notices", "/contact", "/register").permitAll()
            .and().oauth2ResourceServer().jwt().jwtAuthenticationConverter(jwtAuthenticationConverter)
        return http.build()
    }
}