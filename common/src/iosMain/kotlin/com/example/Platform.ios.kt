package com.example

import androidx.compose.ui.window.ComposeUIViewController
import org.jetbrains.compose.resources.ExperimentalResourceApi
import platform.UIKit.UIDevice
import platform.UIKit.UIViewController
import kotlin.native.internal.GC

class IOSPlatform: Platform {
    override val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
}

actual fun getPlatform(): Platform = IOSPlatform()


@ExperimentalResourceApi
fun onceImageTest(needShowImage:Boolean,lifeCycleDelegate: LifeCycleDelegate) : UIViewController = ComposeUIViewController {
    lifeCycleDelegate.changeState {
        println("UIViewController life cycle callback： $it")
    }
    OnceImage(needShowImage = needShowImage)
}

@ExperimentalResourceApi
fun onceImageTest(needShowImage:Boolean,lifeCycleDelegate: LifeCycleDelegate?) : UIViewController = ComposeUIViewController {
    if(lifeCycleDelegate != null) {
        lifeCycleDelegate.changeState {
            println("UIViewController life cycle callback： $it")
        }
    }
    OnceImage(needShowImage = needShowImage)
}

fun GCMethod(){
    GC.collect()
}