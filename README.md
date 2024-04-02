# Introduction
This project is an micronaut + docker + promtail + grafana + loki + prometheus example. 
The starting point for this project is the Justfile.
Runs on Java 21

```bash
just

Available recipes:
    load-test
    build
    run
```

# Build the project
as simple as running the command:

```bash
just build
```

# Running the project
as simple as running the command:

```bash
just run
```

# Grafana access 
Grafana is available on http://localhost:3000. The dashboard for JVM is pre-configured as well as the needed datasources. 

# Misc

Other sub-project documentation

### Micronaut 4.3.4 Documentation

- [User Guide](https://docs.micronaut.io/4.3.4/guide/index.html)
- [API Reference](https://docs.micronaut.io/4.3.4/api/index.html)
- [Configuration Reference](https://docs.micronaut.io/4.3.4/guide/configurationreference.html)
- [Micronaut Guides](https://guides.micronaut.io/index.html)
---

- [Shadow Gradle Plugin](https://plugins.gradle.org/plugin/com.github.johnrengelman.shadow)
- [Micronaut Gradle Plugin documentation](https://micronaut-projects.github.io/micronaut-gradle-plugin/latest/)
- [GraalVM Gradle Plugin documentation](https://graalvm.github.io/native-build-tools/latest/gradle-plugin.html)
### Feature jul-to-slf4j documentation

- [https://www.slf4j.org/legacy.html#jul-to-slf4jBridge](https://www.slf4j.org/legacy.html#jul-to-slf4jBridge)


### Feature serialization-jackson documentation

- [Micronaut Serialization Jackson Core documentation](https://micronaut-projects.github.io/micronaut-serialization/latest/guide/)


### Feature micronaut-aot documentation

- [Micronaut AOT documentation](https://micronaut-projects.github.io/micronaut-aot/latest/guide/)


