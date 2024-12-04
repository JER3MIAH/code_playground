package com.example.lemonadeapp

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.lemonadeapp.ui.theme.LemonadeAppTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            LemonadeAppTheme {
                LemonadeApp()
            }
        }
    }
}

@Composable
fun LemonadeImageSelection(modifier: Modifier = Modifier) {
    var value by remember { mutableStateOf(1) }

    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Button(
            onClick = {
                if (value < 4) {
                    value++
                } else {
                    value = 1
                }

            },
        ) {
            Image(
                painter = painterResource(
                    when (value) {
                        1 -> R.drawable.lemon_tree
                        2 -> R.drawable.lemon_squeeze
                        3 -> R.drawable.lemon_drink
                        else -> R.drawable.lemon_restart
                    }
                ),
                contentDescription = stringResource(
                    when (value) {
                        1 -> R.string.step_1_text
                        2 -> R.string.step_2_text
                        3 -> R.string.step_3_text
                        else -> R.string.step_4_text
                    }
                ),
            )
        }
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            fontSize = 20.sp,
            text = stringResource(
                when (value) {
                    1 -> R.string.step_1_text
                    2 -> R.string.step_2_text
                    3 -> R.string.step_3_text
                    else -> R.string.step_4_text
                }
            )
        )
    }
}

@Preview(
    showBackground = true,
    showSystemUi = true,
)
@Composable
fun LemonadeApp() {
    LemonadeAppTheme {
        LemonadeImageSelection(
            modifier = Modifier
                .fillMaxSize()
                .wrapContentSize(align = Alignment.Center)
        )
    }
}