//
//  ViewController.m
//  UI05_UIGestureRecognizer
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIImageView *imageView;

@property (nonatomic, assign) BOOL isBig;

@end



@implementation ViewController

- (void)dealloc {

    [_imageView release];
    [super dealloc];

}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatImageView];
    [self tap];
    [self longPress];
    [self swip];
    [self screenEdge];
    [self pan];
    [self pinch];
    [self rotation];
}

- (void)creatImageView {
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    self.imageView.frame = CGRectMake(0, 0, 200, 200);
    self.imageView.center = self.view.center;
    
    [self.view addSubview:self.imageView];
    [_imageView release];
    
    /** 开启imageView用户交互. */
    self.imageView.userInteractionEnabled = YES;

}


#pragma mark - 知识点1 UIGestureRecongnizer 类
/**
 * UIGestureRecongnizer 手势识别器类.
 *他是抽象类,不能直接创建对象,是用它的子类创建对象.
 * 7个子类.
 *
 * 1.initWithTarget:action: 创建对象.
 * 2.设置相应的参数.
 * 3.将手势添加到视图上.
 * 4. 实现action方法.
 */



#pragma mark - 知识点2 : 轻拍
- (void)tap {

    /** 1.创建对象. */
//     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget]
  
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    /** 2. 设置参数(API).*/
    tap.numberOfTapsRequired = 2;
    
    /** 3. 添加到视图上. */
    [self.imageView addGestureRecognizer:tap];
    
    [tap release];
    

}

  /** 4. 实现tapAction方法. */
- (void)tapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"咬我啊.咬我啊");
    if (!self.isBig) {
//
//        [UIView animateWithDuration:0.25 animations:^{
//            self.imageView.frame = CGRectMake(0, 0, 200, 200);
//            self.imageView.center = self.view.center;}];
        
//            /** 更改transform属性. */
    tap.view.transform = CGAffineTransformScale(tap.view.transform, 1.5, 1.5);
        tap.view.transform = CGAffineTransformRotate(tap.view.transform, M_2_PI);
//    tap.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
//    tap.view.transform = CGAffineTransformMakeRotation(M_2_PI);

    }else{

    [UIView animateWithDuration:0.25 animations:^{
    self.imageView.frame = CGRectMake(0, 0, 300, 300);
        self.imageView.center = self.view.center;}];
      
    }
    self.isBig = !self.isBig; /* 状态取反. */
    

    
    
    

}
#pragma mark - 知识点 3 : 长按手势
- (void)longPress {

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressAction:)];
    [self.imageView addGestureRecognizer:longPress];
    [longPress release];

}

- (void)pressAction:(UILongPressGestureRecognizer *)longPress {

    if (longPress.state == UIGestureRecognizerStateBegan) {
        
    NSLog(@"干瞪眼,干瞪眼");
    }

}


#pragma mark - 知识点 4 : 轻扫手势


- (void)swip {

    /** 创建对象. */
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    [self.view addGestureRecognizer:swip];
    [swip release];
    

    /** 清扫方向. */
//    swip.direction = UISwipeGestureRecognizerDirectionRight;
//    | UISwipeGestureRecognizerDirectionLeft;

}

- (void)swipAction:(UISwipeGestureRecognizer *)swip {
    
    if (self.view.frame.origin.x == 0) {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.view.frame = CGRectMake(100, 0, self.view.frame.size.width, self.view.frame.size.height);

    }];
       swip.direction = UISwipeGestureRecognizerDirectionLeft;
    }else {
        
    [UIView animateWithDuration:0.25 animations:^{
     self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
        swip.direction = UISwipeGestureRecognizerDirectionRight;
    
    }
}


#pragma mark - 知识点 5 : 屏幕边缘拖动
- (void)screenEdge {

    UIScreenEdgePanGestureRecognizer *screen = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgeAction:)];
    [self.view addGestureRecognizer:screen];
    [screen release];
    
    /** 屏幕边缘方向. */
    screen.edges = UIRectEdgeRight;
}

- (void)screenEdgeAction:(UIScreenEdgePanGestureRecognizer *)screenEdge {


    NSLog(@"GO Go go");

}

#pragma mark - UIview 一个重要属性:transform

/***
 *UIView的transform属性, 类型:CGAffineTransform
 *
 *transform主要实现 移动, 缩放, 旋转.
 *CGAffineTransform,仿射(几何),系统提供了方便的API,进行仿射的计算.
 */

#pragma mark - 知识点 6 : 拖动手势
- (void)pan {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.imageView addGestureRecognizer:pan];
    [pan release];

}
-(void)panAction:(UIPanGestureRecognizer *)pan {
    NSLog(@"走起");
    NSLog(@"hehheda");
   CGPoint point = [pan translationInView:pan.view];
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    /** 更改 self.ImageView.transform属性. */
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, point.y);
    
    /** 参考点归零. */

    [pan setTranslation:CGPointZero inView:pan.view];

}

#pragma mark - 知识点 7 : 捏合手势(缩放)
- (void)pinch {
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.imageView addGestureRecognizer:pinch];
    [pinch release];

}

- (void)pinchAction:(UIPinchGestureRecognizer *)pinch {

    NSLog(@"%f",pinch.scale);
    /*修改self.imageView 的transform属性. */
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    /** 缩放因子 归1. */
    pinch.scale = 1;

}

#pragma mark - 知识点 8 : 旋转手势

- (void)rotation{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [self.imageView addGestureRecognizer:rotation];
    [rotation release];
    

}
- (void)rotationAction:(UIRotationGestureRecognizer *)rotation {

    /** 更改self.imageView的transform属性. */
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    /*弧度归零*/
    rotation.rotation  = 0;


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
