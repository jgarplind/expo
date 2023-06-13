package abi47_0_0.expo.modules.filesystem

import android.content.Context
import abi47_0_0.expo.modules.core.interfaces.InternalModule
import abi47_0_0.expo.modules.interfaces.filesystem.AppDirectoriesModuleInterface
import java.io.File

/*
New Sweet API modules don't have an easy way to access scoped context. We can't initialize them with scoped context as they need a ReactApplicationContext instead.
We can't make ScopedContext inherit from ReactApplicationContext as that would require moving ScopedContext to versioned and a large refactor.

This module is a stopgap solution to provide modules with a way to access ScopedContext directories using the filesystem module, only for our internal modules.
 */

// The class needs to be 'open', because it's inherited in expoview
open class AppDirectoriesModule(private val context: Context) : AppDirectoriesModuleInterface, InternalModule {

  override fun getExportedInterfaces(): List<Class<*>> =
    listOf(AppDirectoriesModuleInterface::class.java)

  override val cacheDirectory: File
    get() = context.cacheDir

  override val persistentFilesDirectory: File
    get() = context.filesDir
}
