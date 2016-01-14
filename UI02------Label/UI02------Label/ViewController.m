//
//  ViewController.m
//  UI02------Label
//
//  Created by dllo on 15/12/20.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIImageView *backGroundView;
@property (nonatomic, retain) UIImageView * image_view;
@property (nonatomic, assign) BOOL isBig;
@end

@implementation ViewController

- (void)dealloc {

    [_backGroundView release];
    [_image_view release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self creatImageView];
    [self creatBackGround];
    [self tap];
    [self longPress];
    [self swip];
//    [self screenEdge];
//    [self pan];
//    [self pinch];
//    [self rotation];
}

- (void)creatBackGround {

   self.backGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQ.jpg"]];
    
    self.backGroundView.frame = self.view.frame;
    self.backGroundView.center = self.view.center;
    
    [self.view addSubview:self.backGroundView];
    
    [self.backGroundView release];
    
    self.backGroundView.userInteractionEnabled = YES;

}
- (void)creatImageView {

    self.image_view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    
    self.image_view.frame = self.view.frame;
    
    [self.view addSubview:self.image_view];
    
    self.image_view.userInteractionEnabled = YES;
    
    [_image_view release];

}

- (void)tap {

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired = 1;/*点击次数*/
    
    [self.backGroundView addGestureRecognizer:tap];
    [tap release];

}
- (void)tapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"轻拍");
    if (!self.isBig) {
        
    [UIView animateWithDuration:1 animations:^{
    self.backGroundView.frame = CGRectMake(0, 0, 300, 300);
        self.backGroundView.center = self.view.center;}];
        

    }else {
        [UIView animateWithDuration:1 animations:^{
            
        self.backGroundView.frame = self.view.frame;
        }];
       
    }
    self.isBig = !self.isBig;
}

- (void)longPress {

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    [self.backGroundView addGestureRecognizer:longPress];
    [longPress release];

}
- (void)longPressAction:(UILongPressGestureRecognizer *)longPress {
    NSLog(@"长按");
    if (longPress.state == UIGestureRecognizerStateBegan) {
    
    
    if (!self.isBig) {
        [UIView animateWithDuration:0.25 animations:^{
            self.backGroundView.frame = CGRectMake(0, 0, 100, 100);
        }];
    }else {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backGroundView.frame = self.view.frame;
    }];
    
    }

    self.isBig = !self.isBig;

}

}


- (void)swip {


    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self  action:@selector(swipAction:)];
    [self.backGroundView addGestureRecognizer:swip];
    [swip release];

}

- (void)swipAction:(UISwipeGestureRecognizer *)swip {
    NSLog(@"轻扫");
    
    if (!self.isBig) {
        [UIView animateWithDuration:0.25 animations:^{
    self.backGroundView.frame = CGRectMake(200, 0, self.view.frame.size.width, self.view.frame.size.height);
    swip.direction = UISwipeGestureRecognizerDirectionLeft;
        }];
    }else {
        [UIView animateWithDuration:0.25 animations:^{
            self.backGroundView.frame = self.view.frame;
            swip.direction = UISwipeGestureRecognizerDirectionRight;
            
        }];
    }
    self.isBig = !self.isBig;
}


- (void)screenEdge {
    UIScreenEdgePanGestureRecognizer *screenEdge = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenAction:)];
    [self.backGroundView addGestureRecognizer:screenEdge];
    [screenEdge release];
    screenEdge.edges = UIRectEdgeRight;

}

- (void)screenAction:(UIScreenEdgePanGestureRecognizer *)screen {
    NSLog(@"篮子,下来");

}

- (void)pan {
    

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.backGroundView addGestureRecognizer:pan];
    [pan release];
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    NSLog(@"拖动");
    CGPoint point = [pan translationInView:pan.view];
    pan.view.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    [pan setTranslation:point inView:pan.view];
    
}


- (void)pinch {

    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.backGroundView addGestureRecognizer:pinch];
    [pinch release];

}


- (void)pinchAction:(UIPinchGestureRecognizer *)pinch {

    NSLog(@"缩放");
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;


}

- (void)rotation {

    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [self.backGroundView addGestureRecognizer:rotation];
    [rotation release];


}

- (void)rotationAction:(UIRotationGestureRecognizer *)rotation {
    NSLog(@"旋转");

    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);

    rotation.rotation = 0;


}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
