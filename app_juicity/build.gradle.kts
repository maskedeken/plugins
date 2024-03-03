plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

setupAll()

android {
    defaultConfig {
        applicationId = "moe.matsuri.plugin.juicity"
        versionCode = 4
        versionName = "v0.4.0"
    }
}
