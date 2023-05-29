package moe.matsuri.exe.trojan_go

import android.net.Uri
import android.os.ParcelFileDescriptor
import io.nekohasekai.sagernet.plugin.NativePluginProvider
import io.nekohasekai.sagernet.plugin.PathProvider
import java.io.File
import java.io.FileNotFoundException

class BinaryProvider : NativePluginProvider() {
    override fun populateFiles(provider: PathProvider) {
        provider.addPath("trojan-go-plugin", 0b111101101)
    }

    override fun getExecutable() = context!!.applicationInfo.nativeLibraryDir + "/libtrojan-go.so"

    override fun openFile(uri: Uri): ParcelFileDescriptor = when (uri.path) {
        "/trojan-go-plugin" -> ParcelFileDescriptor.open(
            File(getExecutable()),
            ParcelFileDescriptor.MODE_READ_ONLY
        )
        else -> throw FileNotFoundException()
    }
}
