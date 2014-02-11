# 第4章笔记 Scatter Point Chart和Candle Stick Chart (flowingdata_subscribers)

**目录**

## 代码
 - 数据，[flowingdata_subscribers.csv](flowingdata_subscribers.csv)
 - 课本代码，[book.R](book.R)
 - 改编代码，[mine.R](mine.R)

## 课本内容简介
 - 绘制RSS订阅人数的Scatter Point Chart

课本代码plot | 改编代码 ggplot2
--------|--------
![课本代码](point-book.png)|![改编代码](point-mine.png)

 - 绘制RSS订阅人数的Candle Stick Chart

课本代码plot+points | 改编代码 ggplot2
--------|--------
![课本代码](candlestick-book.png)|![改编代码](candlestick-mine.png)

## 笔记 - 用ggplot2替代plot画Scatter Point Chart

课本代码使用plot
```R
      plot(subscribers$Subscribers, type="p", ylim=c(0, 30000), xlab="Day")
```

改编代码使用ggplot2
 - geom_point(size = 3, shape = 21)，设置点大小，设置点形状为空心圆圈

```R
      p <- ggplot(subscribers, aes(x=1:length(Subscribers), y=Subscribers))

      # shape #21 is hollow circle
      p <- p + geom_point(size = 3, shape = 21)

      # y limit
      p <- p + ylim(0, 30000)

      # x label
      p <- p + xlab("Day")

      # tune panel and axis color
      p <- p + theme(panel.border = element_blank(),
          panel.grid = element_blank(), panel.background = element_blank(),
          axis.line = element_line(colour="black"))
      p
```

## 笔记 - 用ggplot2替代plot画Candle Stick Chart

课本代码使用plot
```R
      plot(subscribers$Subscribers, type="h", ylim=c(0, 30000),
        xlab="Day", ylab="Subscribers")
      points(subscribers$Subscribers, pch=19, col="black")
```

改编代码使用ggplot2
 - geom_bar(stat="identity", width=0.1)，画细直线作蜡烛杆子
 - geom_point(size = 3)，画蜡烛头

```R
      p <- ggplot(subscribers, aes(x=1:length(Subscribers), y=Subscribers))
      p <- p + geom_bar(stat="identity", width=0.1)

      # by default is shape #16 (solid circle)
      p <- p + geom_point(size = 3)

      # y limit
      p <- p + ylim(0, 30000)

      # x label
      p <- p + xlab("Day")

      # tune panel and axis color
      p <- p + theme(panel.border = element_blank(),
          panel.grid = element_blank(), panel.background = element_blank(),
          axis.line = element_line(colour="black"))
      p
```
