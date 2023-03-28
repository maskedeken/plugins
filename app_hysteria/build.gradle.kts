plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

setupAll()

android {
    defaultConfig {
        applicationId = "moe.matsuri.exe.hysteria"
        versionCode = 7
        versionName = "1.3.4-1"
        splits.abi {
            reset()
            include("arm64-v8a", "armeabi-v7a")
        }
    }
}
