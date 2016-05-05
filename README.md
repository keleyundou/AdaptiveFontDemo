# AdaptiveFontDemo
关于字体适配有2种方案。

* 方案一：
    设置一个大小区域范围，比如10~30`pointSize`的范围(pointSize为`UIFont`的一个CGFloat类型的属性)，然后`for`循环降序遍历此范围设置一个临时的`UIFont`变量，根据此变量计算当前文本的大小，与当前`UILabel`的`height`作比较找出合适的字体。

```

#define ADAPTIVE__FONT_SIZE_MINIMUM_VALUE 20
#define ADAPTIVE_FONT_SIZE_MAXIMUM_VALUE 30

-(UIFont *) adjustFontSizeToFillItsContents
{
    NSString* text = self.text;
    
    for (int i = ADAPTIVE_FONT_SIZE_MAXIMUM_VALUE; i>ADAPTIVE__FONT_SIZE_MINIMUM_VALUE; i--) {
        
        UIFont *font = [UIFont fontWithName:self.font.fontName size:(CGFloat)i];
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: font}];
        
        CGRect rectSize = [attributedText boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        if (rectSize.size.height <= self.frame.size.height) {
            return [UIFont fontWithName:self.font.fontName size:(CGFloat)i];
            break;
        }
    }
    return self.font;
}

```

* 方案二：
计算出一个`scale`重新设置`UIFont`，伪代码如下：

```
CGFloat scale = ([UIScreen mainScreen].bounds.size.width / 320);
NSLog(@"before : %.1f", [font pointSize]);
font = [UIFont fontWithName:[font fontName] size:fontSize * scale];
NSLog(@"after : %.1f", [font pointSize]);
```
既然需要重新设置`UIFont`，那么我们不可避免的要`hook`下`UIFont`的类方法``fontWithName:size:`做个函数交换的处理。
函数的交换我们需要用到`runtime`机制。
```
void bd_exchageClassMethod(Class aClass, SEL oldSEL, SEL newSEL)
{
    Method oldClsMethod = class_getClassMethod(aClass, oldSEL);
    assert(oldClsMethod);
    Method newClsMethod = class_getClassMethod(aClass, newSEL);
    assert(newClsMethod);
    method_exchangeImplementations(oldClsMethod, newClsMethod);
}
```

然后，我们给`UIFont`创建一个`Categroy`文件，文件名为`AdaptiveFont`。在实现文件代码如下：
```
@implementation UIFont (AdaptiveFont)

+ (void)hook
{
    bd_exchageClassMethod([UIFont class], @selector(fontWithName:size:), @selector(hook_fontWithName:size:));
}

+ (UIFont *)hook_fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
    NSLog(@"before : %.1f", fontSize);
    CGFloat scale = ([UIScreen mainScreen].bounds.size.width / 320);
    NSLog(@"scale : %f", scale);
    UIFont *font = [self hook_fontWithName:fontName size:fontSize * scale];
    NSLog(@"after : %.1f", [font pointSize]);
    printf("<--------------------->\n");
    return font;
}

@end
```

接口文件暴漏相关方法如下：
```
@interface UIFont (AdaptiveFont)

+ (void)hook;
+ (UIFont *)hook_fontWithName:(NSString *)fontName size:(CGFloat)fontSize;

@end
```

相对比较而言，我还是倾向于方法二。方法一的前提条件是`height`要适配好，不能是绝对值，否效果。当然，方法二也一样，只不过`height`若是绝对值，会出现文字显示不全的问题。
在用法上，方法一只需调用`adjustFontSizeToFillItsContents`，而方法二需在`application:didFinishLaunchingWithOptions:`函数调用下`hook`。

test
