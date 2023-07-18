package com.example

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform


interface LifeCycleDelegate
{
    fun changeState(callback:(String)->Unit)
}
