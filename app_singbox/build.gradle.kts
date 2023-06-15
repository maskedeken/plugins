plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

setupAll()

android {
    defaultConfig {
        applicationId = "moe.matsuri.plugin.singbox"
        versionCode = 15
        versionName = "v1.3-beta14"
        splits.abi {
            reset()
            include("arm64-v8a", "armeabi-v7a")
        }
    }
}
