package com.example.artspaceapp

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.annotation.DrawableRes
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.artspaceapp.ui.theme.ArtSpaceAppTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            ArtSpaceAppTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = Color.White,
                ) {
                    ArtSpaceDisplay(
                        modifier = Modifier
                            .padding(all = 20.dp)
                            .verticalScroll(rememberScrollState())
                    )
                }
            }
        }
    }
}

@Composable
fun ArtSpaceDisplay(
    modifier: Modifier = Modifier,
) {
    val images = listOf(
        R.drawable.image_1,
        R.drawable.image_2,
        R.drawable.image_3,
    )

    var index by remember {
        mutableStateOf(0)
    }

    Column(
        modifier = modifier,
    ) {
        ArtDisplay(
            image = images[index],
            modifier = Modifier
                .fillMaxWidth()
                .height(400.dp)
                .background(color = Color.White)
                .clip(RoundedCornerShape(4.dp))
        )
        Text(
            text = stringResource(
                id = when (index) {
                    0 -> R.string.image_1
                    1 -> R.string.image_2
                    2 -> R.string.image_3
                    else -> R.string.image_1
                }
            ),
            modifier = Modifier
                .align(Alignment.CenterHorizontally)
                .padding(vertical = 20.dp)
        )
        Row(
            horizontalArrangement = Arrangement.SpaceBetween,
            modifier = Modifier.fillMaxWidth()
        ) {
            Button(
                onClick = {
                    index = if (index > 0) index - 1 else images.size - 1
                }
            ) {
                Text(text = "Previous")
            }
            Button(
                onClick = {
                    index = if (index < (images.size - 1)) index + 1 else 0

                }
            ) {
                Text(text = "Next")
            }
        }
    }
}

@Composable
fun ArtDisplay(
    @DrawableRes image: Int,
    modifier: Modifier = Modifier,
) {
    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(4.dp),
        color = Color.Cyan,
        shadowElevation = 9.dp,
    ) {
        Image(
            painter = painterResource(id = image),
            contentDescription = "Image 1",
            modifier = Modifier
                .padding(all = 30.dp)
                .fillMaxSize(),
        )
    }
}


@Preview(
    showBackground = true,
    showSystemUi = true,
)
@Composable
fun GreetingPreview() {
    ArtSpaceAppTheme {
        ArtSpaceDisplay()
    }
}