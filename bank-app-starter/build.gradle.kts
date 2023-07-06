import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

val springSecurityVersion: String by properties
val springBootVersion: String by properties

plugins {
    id("java")
    kotlin("jvm") version "1.9.0"
}

group = "com.dzkashlach"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation(kotlin("stdlib-jdk8"))
    implementation("org.springframework.boot:spring-boot-starter-oauth2-resource-server:$springBootVersion")
    implementation("org.springframework.boot:spring-boot-starter-security:$springBootVersion")
    implementation("org.springframework.boot:spring-boot-starter-web:$springBootVersion")
    implementation("org.springframework.boot:spring-boot-configuration-processor:3.0.0")
    implementation("org.springframework.boot:spring-boot:3.0.0")
    implementation("org.springframework.boot:spring-boot-autoconfigure:3.0.0")

}

tasks.register("prepareKotlinBuildScriptModel"){}

tasks.test {
    useJUnitPlatform()
}
val javaVersion = JavaVersion.VERSION_17.toString()
val compileKotlin: KotlinCompile by tasks
compileKotlin.kotlinOptions {
    jvmTarget = javaVersion
}
val compileTestKotlin: KotlinCompile by tasks
compileTestKotlin.kotlinOptions {
    jvmTarget = javaVersion
}