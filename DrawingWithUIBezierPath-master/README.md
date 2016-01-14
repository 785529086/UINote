#通过UIBezierPath实现简单的画板功能

>说明: 
>iOS中实现画板功能, 可以有多种方法. 此文使用UIBezierPath(贝塞尔曲线)实现
> 
>
	
##核心API
**Class:** UIBezierPath, UIView

**Delegate:** 无

**API:** 

```OC

/** UIView 类相关*/
- (void)drawRect:(CGRect)rect
- (void)setNeedsDisplay 

/** UIBezierPath 类相关 */
@property(nonatomic) CGFloat lineWidt

- (void)moveToPoint:(CGPoint)point
- (void)addLineToPoint:(CGPoint)point
- (void)stroke
```
