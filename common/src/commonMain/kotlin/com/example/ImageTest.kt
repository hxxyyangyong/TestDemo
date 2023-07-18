package com.example

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.size
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import org.jetbrains.compose.resources.ExperimentalResourceApi
import org.jetbrains.compose.resources.painterResource


@OptIn(ExperimentalResourceApi::class)
@Composable
internal fun OnceImage(needShowImage:Boolean = true){
    if(needShowImage) {
        Image(
            painter = painterResource("img.png"),
            modifier = Modifier.fillMaxWidth().aspectRatio(413.0f / 106.0f),
            contentDescription = "test"
        )
    }else{
        Column {
            Text("none image")
        }
    }
}