plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

setupAll()

android {
    defaultConfig {
        applicationId = "moe.matsuri.plugin.xray"
        versionCode = 14
        versionName = "v1.8.0-4"
    }
}
