group = "com.example"
version = "1.0-SNAPSHOT"

allprojects {
    repositories {
        google()
        mavenCentral()
        maven("https://maven.pkg.jetbrains.space/public/p/compose/dev")
    }
}

plugins {
    //trick: for the same plugin versions in all sub-modules
//    id("com.android.application").version("8.0.2").apply(false)
//    id("com.android.library").version("8.0.2").apply(false)
//    kotlin("android").version("1.8.21").apply(false)
//    kotlin("multiplatform").version("1.8.21").apply(false)
    kotlin("multiplatform") apply false
    kotlin("android") apply false
    id("com.android.application") apply false
    id("com.android.library") apply false
//    id("org.jetbrains.compose") apply false
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}

