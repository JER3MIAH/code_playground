package com.example.myapplication

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.example.myapplication.ui.theme.MyApplicationTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyApplicationTheme {
                val name = remember {
                   mutableStateOf("")
                }
                val names = remember {
                    mutableStateOf(listOf<String>())
                }
                Column(
                    modifier = Modifier.fillMaxSize()
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth()
                    ) { 
                        BasicTextField(
                            value = name.value,
                            onValueChange = { text -> name.value = text },
                        )
                        Spacer(modifier = Modifier.width(20.dp))
                        Button(
                            onClick = {
                                if (name.value.isNotBlank()) {
                                    names.value = names.value + name.value
                                    name.value = ""
                                }
                            }
                        ) {
                            Text(text = "Add")
                        }
                    }
                    LazyColumn(
                        content = {
                            items(names.value.size) {
                                    index -> ListTile(
                                title = names.value[index],
                                subtitle = null,
                            )
                            }
                        }
                    )
                }
            }
        }
    }
}

@Composable
fun ListTile(
    title: String,
    subtitle: String?,
    leadingIcon: @Composable (() -> Unit)? = null,
    trailingIcon: @Composable (() -> Unit)? = null,
    onClick: (() -> Unit)? = null
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp)
            .clickable { onClick?.invoke() },
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Leading icon (if provided)
        if (leadingIcon != null) {
            Box(modifier = Modifier.padding(end = 16.dp)) {
                leadingIcon()
            }
        }

        // Column containing title and subtitle
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MaterialTheme.typography.bodyLarge,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            if (subtitle != null) {
                Text(
                    text = subtitle,
                    style = MaterialTheme.typography.bodySmall,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }

        // Trailing icon (if provided)
        if (trailingIcon != null) {
            Box(modifier = Modifier.padding(start = 16.dp)) {
                trailingIcon()
            }
        }
    }
}
