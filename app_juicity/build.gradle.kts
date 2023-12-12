plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

setupAll()

android {
    defaultConfig {
        applicationId = "moe.matsuri.plugin.juicity"
        versionCode = 3
        versionName = "v0.3.0-1"
    }
}
