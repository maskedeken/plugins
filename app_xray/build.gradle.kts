plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

setupAll()

android {
    defaultConfig {
        applicationId = "moe.matsuri.plugin.xray"
        versionCode = 18
        versionName = "v1.8.3-2"
    }
}
