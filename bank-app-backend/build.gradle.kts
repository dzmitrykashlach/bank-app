import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

val flywayVersion: String by properties
val springBootVersion: String by properties
val springSecurityVersion: String by properties

plugins {
    `java-library`
    id("org.springframework.boot") version "3.0.0"
    id("org.flywaydb.flyway") version "9.8.1"
    kotlin("jvm") version "1.9.0"
}

repositories {
    mavenLocal()
    maven {
        url = uri("https://repo.maven.apache.org/maven2/")
    }
    mavenCentral()
}

dependencies {
    implementation(project(":bank-app-starter"))
    implementation("org.springframework.boot:spring-boot-starter-security:$springBootVersion")
    implementation("org.springframework.boot:spring-boot-starter-web:$springBootVersion")
    implementation("org.springframework.ldap:spring-ldap-core:$springBootVersion")
    implementation("org.springframework.security:spring-security-ldap:$springSecurityVersion")
    implementation("org.springframework.boot:spring-boot-starter-jdbc:$springBootVersion")
    implementation("org.springframework.boot:spring-boot-starter-data-jpa:$springBootVersion")
    implementation("io.jsonwebtoken:jjwt-api:0.11.5")
    implementation("org.flywaydb:flyway-mysql:$flywayVersion")
    implementation("org.flywaydb:flyway-core:$flywayVersion")
    runtimeOnly("com.mysql:mysql-connector-j:8.0.31")
    runtimeOnly("org.springframework.boot:spring-boot-devtools:$springBootVersion")
    runtimeOnly("io.jsonwebtoken:jjwt-impl:0.11.5")
    runtimeOnly("io.jsonwebtoken:jjwt-jackson:0.11.5")
    testImplementation("org.springframework.boot:spring-boot-starter-test:$springBootVersion")
    testImplementation("org.springframework.security:spring-security-test:$springSecurityVersion")
    implementation(kotlin("stdlib-jdk8"))
}

group = "com.dzkashlach"
version = "0.0.1-SNAPSHOT"
description = "bank-application"
java.sourceCompatibility = JavaVersion.VERSION_17
java.targetCompatibility = JavaVersion.VERSION_17


tasks.withType<JavaCompile>() {
    options.encoding = "UTF-8"
}

tasks.withType<Javadoc>() {
    options.encoding = "UTF-8"
}

tasks.register("prepareKotlinBuildScriptModel"){}
val jvmTargetVersion = "17"
val compileKotlin: KotlinCompile by tasks
compileKotlin.kotlinOptions {
    jvmTarget = jvmTargetVersion
}
val compileTestKotlin: KotlinCompile by tasks
compileTestKotlin.kotlinOptions {
    jvmTarget = jvmTargetVersion
}