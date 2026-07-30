allprojects {
    repositories {
        mavenLocal()
        google()
        mavenCentral()
        // Asia mirrors as fallback when upstream stalls.
        maven { url = uri("https://maven.aliyun.com/repository/google") }
        maven { url = uri("https://maven.aliyun.com/repository/central") }
        maven { url = uri("https://maven.aliyun.com/repository/public") }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Flutter plugins may request AGP 8.13.x; force the cached project AGP to avoid network stalls.
subprojects {
    buildscript {
        configurations.configureEach {
            resolutionStrategy.eachDependency {
                if (requested.group == "com.android.tools.build") {
                    when (requested.name) {
                        "gradle", "builder", "gradle-api", "builder-model",
                        "gradle-settings-api", "aaptcompiler", "apkzlib", "apksig",
                        -> useVersion("8.11.1")
                    }
                }
            }
        }
    }
    configurations.configureEach {
        resolutionStrategy.eachDependency {
            if (requested.group == "com.android.tools.build") {
                when (requested.name) {
                    "gradle", "builder", "gradle-api", "builder-model",
                    "gradle-settings-api", "aaptcompiler", "apkzlib", "apksig",
                    -> useVersion("8.11.1")
                }
            }
        }
    }
}

// AGP 8+ requires namespace; older plugins only declare package in AndroidManifest.
subprojects {
    pluginManager.withPlugin("com.android.library") {
        extensions.configure<com.android.build.gradle.LibraryExtension>("android") {
            if (namespace.isNullOrBlank()) {
                val manifest = file("src/main/AndroidManifest.xml")
                val pkg =
                    if (manifest.exists()) {
                        Regex("""package\s*=\s*"([^"]+)"""")
                            .find(manifest.readText())
                            ?.groupValues
                            ?.getOrNull(1)
                    } else {
                        null
                    }
                namespace = pkg ?: "com.flutter.legacy.${project.name.replace('-', '_')}"
            }
        }
    }
}

// Only force JVM 1.8 Kotlin for known legacy Java-1.8 plugins.
val legacyKotlinJvm18 = setOf("reactive_ble_mobile")
subprojects {
    if (name !in legacyKotlinJvm18) return@subprojects
    tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
        compilerOptions.jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_1_8)
    }
}

// Skip extract*Annotations (pulls lint-checks / intellij-core over flaky Google CDN).
// Release APK does not need these for packaging.
subprojects {
    tasks.configureEach {
        if (name.startsWith("extract") && name.endsWith("Annotations")) {
            enabled = false
        }
    }
}

// sync*LibJars validates typedefs.txt at configuration time (not doFirst).
subprojects {
    pluginManager.withPlugin("com.android.library") {
        afterEvaluate {
            listOf("release", "debug").forEach { buildType ->
                val capitalize = buildType.replaceFirstChar { it.uppercase() }
                val typedefsFile =
                    layout.buildDirectory
                        .file(
                            "intermediates/annotations_typedef_file/$buildType/extract${capitalize}Annotations/typedefs.txt",
                        )
                        .get()
                        .asFile
                if (!typedefsFile.exists()) {
                    typedefsFile.parentFile.mkdirs()
                    typedefsFile.writeText("")
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
