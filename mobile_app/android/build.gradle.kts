allprojects {
    repositories {
        google()
        mavenCentral()
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

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
