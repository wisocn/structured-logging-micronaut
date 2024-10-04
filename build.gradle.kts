version = "0.4"
group = "com.structured.logging"
var entrypoint = "com.logging.Application"
var basePackage = "com.logging.*"

plugins {
    id("groovy")
    id("com.github.johnrengelman.shadow") version "8.1.1"
    id("io.micronaut.application") version "4.3.3"
    id("io.micronaut.aot") version "4.3.3"
}

repositories {
    mavenCentral()
}

dependencies {
    // serialization
    annotationProcessor("io.micronaut.serde:micronaut-serde-processor")
    implementation("io.micronaut.serde:micronaut-serde-jackson")

    // logging facade slf4j
    implementation("org.slf4j:slf4j-api:2.0.12")

    implementation("io.micronaut.micrometer:micronaut-micrometer-core")
    implementation("io.micronaut.micrometer:micronaut-micrometer-registry-prometheus")
    implementation("io.micronaut:micronaut-management")

    // logging logback with encoder
    implementation("ch.qos.logback:logback-classic:1.5.3")
    implementation("ch.qos.logback:logback-core:1.5.3")
    implementation("net.logstash.logback:logstash-logback-encoder:7.4")

    runtimeOnly("org.yaml:snakeyaml")
}

application {
    mainClass.set(entrypoint)
}

java {
    sourceCompatibility = JavaVersion.toVersion("17")
    targetCompatibility = JavaVersion.toVersion("17")
}

micronaut {
    runtime("netty")
    testRuntime("spock2")
    processing {
        incremental(true)
        annotations(basePackage)
    }
}



