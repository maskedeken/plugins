plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

setupAll()

android {
    defaultConfig {
        applicationId = "moe.matsuri.exe.naive"
        versionCode = 2
        versionName = "112.0.5615.49-2"
        splits.abi {
            reset()
            include("arm64-v8a", "armeabi-v7a")
        }
    }
}
