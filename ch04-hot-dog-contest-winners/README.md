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

方案A: 所有bar填充相同颜色
```R
    fill_colors <- "red"
```
![单色 课本代码](single-color-book.png)

方案B: 所有bar根据冠军是否是美国填充不同颜色
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

## 笔记 - TODO
