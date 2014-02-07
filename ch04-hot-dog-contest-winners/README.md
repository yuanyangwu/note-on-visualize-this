# 第4章笔记 Bar Chart (hot-dog-contest-winners)

## 代码
 - 数据，[hot-dog-contest-winners.csv](hot-dog-contest-winners.csv)
 - 课本代码，[book.R](book.R)
 - 改编代码，[mine.R](mine.R)

## 课本内容简介
 - 使用barplot来绘制bar chart
```R
    barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year,
      col=fill_colors,
      xlab="Year", ylab="Hod dogs and buns (HDB) eaten",
      border=NA, space=0.3
      )
```

 - 两种填充颜色的方案

   - 方案A: 所有bar填充相同颜色
```R
    fill_colors <- "red"
```
![单色 课本代码](single-color-book.png)

   - 方案B: 所有bar根据冠军是否是美国填充不同颜色
```R
      for ( i in 1:length(hotdogs$Country) ) {
        if (hotdogs$Country[i] == "United States") {
          fill_colors <- c(fill_colors, "#821122")
        } else {
          fill_colors <- c(fill_colors, "#cccccc")
        }
      }
```

![条件色 课本代码](conditional-color-book.png)

## 笔记 - 用“向量化ifelse”替代“for + if/else”

为了生成方案B里不同颜色的向量，课本里使用大段的“for + if/else”
```R
      fill_colors <- c()
      for ( i in 1:length(hotdogs$Country) ) {
        if (hotdogs$Country[i] == "United States") {
          fill_colors <- c(fill_colors, "#821122")
        } else {
          fill_colors <- c(fill_colors, "#cccccc")
        }
      }
```

更聪明简洁的方法是“向量化ifelse”。其中，
 - 参数1，条件向量
 - 参数2和3，常量或向量
```R
      fill_colors <- ifelse(hotdogs$Country == "United States",
        "#821122", "#cccccc")
```

## 笔记 - 用ggplot2替代barplot


