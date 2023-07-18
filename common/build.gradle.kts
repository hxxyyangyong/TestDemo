import org.jetbrains.compose.compose

plugins {
    kotlin("multiplatform")
    id("org.jetbrains.compose")
    id("com.android.library")
//    kotlin("multiplatform")
    kotlin("native.cocoapods")
//    kotlin("plugin.serialization") version "1.8.20"
//    id("com.android.library")
//    id("org.jetbrains.compose")
//    id("kotlinx-atomicfu")
//    id("com.google.devtools.ksp") version "1.8.20-1.0.11"
}

group = "com.example"
version = "1.0-SNAPSHOT"

@OptIn(org.jetbrains.kotlin.gradle.ExperimentalKotlinGradlePluginApi::class)
kotlin {
    android()
    jvm("desktop") {
        jvmToolchain(11)
    }
    listOf(
        iosX64()
    ).forEach {
        it.binaries.framework {
            baseName = "common"
            isStatic = true

//            export("com.arkivanov.decompose:decompose:$deComposeVersion")
//            export("com.arkivanov.essenty:lifecycle:$essentyVersion")
//            // Optional, only if you need state preservation on Darwin (Apple) targets
//            export("com.arkivanov.essenty:state-keeper:<essenty_version>")
//            // Optional, only if you need state preservation on Darwin (Apple) targets
//            export("com.arkivanov.parcelize.darwin:runtime:<parcelize_darwin_version>")
        }

        it.compilations["main"].kotlinOptions.freeCompilerArgs += listOf(
            "-Xexport-kdoc",
            "-Xallocator=mimalloc",
            "-Xruntime-logs=gc=info",
            "-Xgc=cms"
        )
    }
//    iosArm64()
//    iosSimulatorArm64()

    cocoapods {
        summary = "Some description for the Shared Module"
        homepage = "Link to the Shared Module homepage"
        version = "1.0"
        ios.deploymentTarget = "14.1"
        podfile = project.file("../iosApp/Podfile")
        framework {
            baseName = "common"
            isStatic = true
        }
        extraSpecAttributes["resources"] =
            "['src/commonMain/resources/**', 'src/iosMain/resources/**']"
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation(compose.ui)
                implementation(compose.foundation)
                implementation(compose.material)
                implementation(compose.runtime)
                @OptIn(org.jetbrains.compose.ExperimentalComposeLibrary::class)
                implementation(compose.components.resources)
            }
        }
//        val commonTest by getting {
//            dependencies {
//                implementation(kotlin("test"))
//            }
//        }
        val androidMain by getting {
            dependencies {
                api("androidx.appcompat:appcompat:1.5.1")
                api("androidx.core:core-ktx:1.9.0")
            }
        }
//        val androidTest by getting {
//            dependencies {
//                implementation("junit:junit:4.13.2")
//            }
//        }

        val iosX64Main by getting
//        val iosArm64Main by getting
//        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
//            iosArm64Main.dependsOn(this)
//            iosSimulatorArm64Main.dependsOn(this)
            dependencies {
//                implementation("io.ktor:ktor-client-darwin:$ktorVersion")
            }
        }
        val iosX64Test by getting
//        val iosArm64Test by getting
//        val iosSimulatorArm64Test by getting
//        val iosTest by creating {
//            dependsOn(commonTest)
//            iosX64Test.dependsOn(this)
////            iosArm64Test.dependsOn(this)
////            iosSimulatorArm64Test.dependsOn(this)
//        }

        val desktopMain by getting {
            dependencies {
                api(compose.preview)
            }
        }
//        val desktopTest by getting
    }
}

android {
    namespace = "com.example"
    compileSdk = 33
    sourceSets["main"].resources.srcDirs("src/commonMain/resources")
    defaultConfig {
        minSdk = 24
        targetSdk = 33
    }
}

gradle.taskGraph.whenReady {
//    allTasks
//        .filter { it.hasProperty("duplicatesStrategy") } // Because it's some weird decorated wrapper that I can't cast.
//        .forEach {
//            it.setProperty("duplicatesStrategy", "EXCLUDE")
//        }

    tasks.forEach {
        if (it.name.contains("Release", true))
            it.enabled = false
    }
}