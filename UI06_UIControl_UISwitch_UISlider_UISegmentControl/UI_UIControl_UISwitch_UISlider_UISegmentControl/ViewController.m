//
//  ViewController.m
//  UI_UIControl_UISwitch_UISlider_UISegmentControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIImageView *imageViewZombie;
@property (nonatomic, retain) UISwitch *sw;

@end

@implementation ViewController

- (void)dealloc {

    [_imageViewZombie release];
    [super dealloc];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self creatImageView];
    [self createSwitch];
    
    [self createSlider];
    [self createSegment];
    
}


- (void)creatImageView {
    _imageViewZombie = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Zombie1.tiff"]];
    _imageViewZombie.frame = CGRectMake(0, 0, 300, 350);
    _imageViewZombie.center = self.view.center;
    [self.view addSubview:_imageViewZombie];
    [_imageViewZombie release];
    
    
    
    NSMutableArray *arrAni = [NSMutableArray array];
    for (int i = 0; i < 22; i++) {
        NSString *name = [NSString stringWithFormat:@"Zombie%d.tiff",i];
        UIImage *image = [UIImage imageNamed:name];
        [arrAni addObject:image];
    }
    _imageViewZombie.animationImages = arrAni;
    _imageViewZombie.animationDuration = arrAni.count * 0.1;
    _imageViewZombie.animationRepeatCount = 0;
    

    
}



#pragma mark - 知识点1 UISwitch (开关控件)

- (void)createSwitch {
    self.sw = [[UISwitch alloc] initWithFrame:CGRectMake(50, 50, 0, 0)];
    [self.view addSubview:self.sw];
    [self.sw release];
    
    
    /* API:*/
    self.sw.tintColor = [UIColor redColor];
    self.sw.onTintColor = [UIColor blueColor];
    self.sw.thumbTintColor = [UIColor orangeColor];
    
    
    /*  添加事件. */
    [self.sw addTarget:self action:@selector(swichAction:) forControlEvents:UIControlEventValueChanged];
    
}

/** 控制动画开关. */
- (void)swichAction:(UISwitch *)sw {

    NSLog(@"开关");
    if (sw.on) {
        [_imageViewZombie startAnimating];
    }else {
        [_imageViewZombie stopAnimating];
    }
}

#pragma mark - 知识点2 : UISlider(滑动条)

- (void)createSlider {
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    [self.view addSubview:slider];
    [slider release];
    
    /** API. */
    slider.minimumValue = 0;
    slider.maximumValue = 10;
    slider.minimumValueImage = [UIImage imageNamed:@"5.png"];
    slider.maximumValueImage = [UIImage imageNamed:@"1.png"];
    
    
    
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    

}

/** 控制动画速度. */
- (void)sliderAction:(UISlider *)slider {

    NSLog(@"走起");

    
    
    
    _imageViewZombie.animationDuration = _imageViewZombie.animationImages.count * (0.1 / slider.value);
    if (self.sw.on) {

    [_imageViewZombie startAnimating];
    }
}

#pragma mark - 知识点3 UISegmentControl

- (void)createSegment {

    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"红",@"黄",@"蓝",@"黑"]];
    segment.frame = CGRectMake(50, 600, 300, 40);
    [self.view addSubview:segment];
    [segment release];
    
    
    
    /** 默认选中的item. */
    segment.selectedSegmentIndex = 1;
    
    /** 添加事件. */
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];

}

/** 界面颜色切换. */
- (void)segmentAction:(UISegmentedControl *)segment {

    switch (segment.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor = [UIColor redColor];
            break;
        case 1:self.view.backgroundColor = [UIColor yellowColor];break;
        case 2:self.view.backgroundColor = [UIColor blueColor];break;
        case 3:self.view.backgroundColor = [UIColor blackColor];break;
            
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
