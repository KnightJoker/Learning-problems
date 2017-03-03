title: 核心动画(Core Animation)
description: Core Animation is a graphics rendering and animation infrastructure available on both iOS and OS X that you use to animate the views and other visual elements of your app
categories:
- iOS
tags:
- 动画

---

之前写过一篇关于动画(UIView)的一篇[博客](http://dbcxl.com/2016/06/24/Animations/)

不过在 iOS 开发中却有着另外一套功能更为强大、效果更华丽的动画API -- [Core Animation](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/Introduction/Introduction.html)

![](https://github.com/KnightJoker/KnightJoker.github.io/blob/master/Img/ca_architecture_2x.png?raw=true)

可以看到，核心动画位于UIKit的下一层，相比UIView动画，它可以实现更复杂的动画效果。

给view加上动画，本质上是对其layer进行操作，layer包含了各种支持动画的属性，动画则包含了属性变化的值、变化的速度、变化的时间等等，两者结合产生动画的过程。

核心动画和UIView动画的对比：UIView动画可以看成是对核心动画的封装，和UIView动画不同的是，通过核心动画改变layer的状态（比如position），动画执行完毕后实际上是没有改变的（表面上看起来已改变）。

总体来说核心动画的优点有：

- 性能强大，使用硬件加速，可以同时向多个图层添加不同的动画效果

- 接口易用，只需要少量的代码就可以实现复杂的动画效果。

- 运行在后台线程中，在动画过程中可以响应交互事件（UIView动画默认动画过程中不响应交互事件）。

![](https://github.com/KnightJoker/KnightJoker.github.io/blob/master/Img/core_animation.png?raw=true)

CAAnimation是所有动画对象的父类，实现CAMediaTiming协议，负责控制动画的时间、速度和时间曲线等等，是一个抽象类，不能直接使用。

CAPropertyAnimation ：是CAAnimation的子类，它支持动画地显示图层的keyPath，一般不直接使用。

iOS9.0之后新增CASpringAnimation类，它实现弹簧效果的动画，是CABasicAnimation的子类。

　综上，核心动画类中可以直接使用的类有：

- CABasicAnimation
- CAKeyframeAnimation
- CATransition
- CAAnimationGroup
- CASpringAnimation

### 核心动画类的常用属性
</br>
**keyPath：**可以指定keyPath为CALayer的属性值，并对它的值进行修改，以达到对应的动画效果，需要注意的是部分属性值是不支持动画效果的。

以下是具有动画效果的keyPath：

```
     //CATransform3D Key Paths : (example)transform.rotation.z
     //rotation.x
     //rotation.y
     //rotation.z
     //rotation 旋轉
     //scale.x
     //scale.y
     //scale.z
     //scale 缩放
     //translation.x
     //translation.y
     //translation.z
     //translation 平移

     //CGPoint Key Paths : (example)position.x
     //x
     //y

     //CGRect Key Paths : (example)bounds.size.width
     //origin.x
     //origin.y
     //origin
     //size.width
     //size.height
     //size

     //opacity
     //backgroundColor
     //cornerRadius 
     //borderWidth
     //contents 

     //Shadow Key Path:
     //shadowColor 
     //shadowOffset 
     //shadowOpacity 
     //shadowRadius 
```

例子：

```
- (void)position {
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"position"];
    ani.toValue = [NSValue valueWithCGPoint:self.centerShow.center];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction 	functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.cartCenter.layer addAnimation:ani forKey:@"PostionAni"];
}
```