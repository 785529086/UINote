//
//  Picture.m
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "Picture.h"




/* 延展. */
@interface Picture ()<UIScrollViewDelegate>

/** 两个控件属性. */
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) UIPageControl *page;

/** 接收数组属性. */
@property (nonatomic, retain) NSMutableArray *arrImages;



@end

@implementation Picture

- (void)dealloc {

    [_scroll release];
    [_page release];
    [_arrImages release];
    [super dealloc];



}



//-(instancetype)initWithFrame:(CGRect)frame {
//
//    self = [super initWithFrame:frame];


//}


- (instancetype)initWithFrame:(CGRect)frame images:(NSArray <NSString *> *)images {
    self = [super initWithFrame:frame];
    if (self) {
        self.arrImages = [NSMutableArray arrayWithArray:images];
        
        /** 子控件的创建. */
        [self createScrollWithFrame:frame];
        [self createPageViewWithFrame:frame];
        
  
    }
    return self;
}

#pragma mark - UIScrollView
- (void)createScrollWithFrame:(CGRect)frame {

    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,frame.size.width , frame.size.height)];
    [self addSubview:self.scroll];
    [_scroll release];
    self.scroll.backgroundColor = [UIColor lightGrayColor];
    
    /** API. */
    self.scroll.contentSize = CGSizeMake(frame.size.width * self.arrImages.count, frame.size.height);
    /** scrollView上面添加ImageView对象照片. */
    
    [self createImageViewWithFrame:frame];
    
    /** 开启翻页效果. */
    self.scroll.pagingEnabled = YES;
    
    /** 到边缘是否有回弹效果. */
    self.scroll.bounces = YES;
    
    self.scroll.delegate = self;
    
    
    /** 设置缩放比例. */
    self.scroll.minimumZoomScale = 0.5;
    self.scroll.maximumZoomScale = 2;
    
    
    

}

- (void)createImageViewWithFrame:(CGRect)frame {
    

    for (int i = 0; i < self.arrImages.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arrImages[i]]];
        
        imageView.frame = CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
        [self.scroll addSubview:imageView];
        [imageView release];
    }

}


#pragma mark - UIScrollView 协议方法

/** 当滑动内容视图时,调用此方法. */
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//    NSLog(@"%f ",scrollView.contentOffset.x);
//
//}

/** 当减速已经完成,调用此方法. */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    NSLog(@"%f",scrollView.contentOffset.x);
    
    /** 设置pagecontrol的currentPage属性. */
    
    self.page.currentPage = scrollView.contentOffset.x / 300;
    
    
//    if (scrollView.contentOffset.x == 0) {
//        self.page.currentPage = 0;
//    }else if(scrollView.contentOffset.x == 300) {
//        self.page.currentPage = 300;
//    }


}


/** 返回一个要缩放的view. */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {

    return [scrollView.subviews firstObject];
    
}


- (void)createPageViewWithFrame:(CGRect)frame {

    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, 40)];
    self.page.center = CGPointMake(frame.size.width / 2 , frame.size.height - 20);
    [self addSubview:self.page];
    [_page release];
    self.page.backgroundColor = [UIColor blackColor];
    
    /** 页面数. */
    self.page.numberOfPages = self.arrImages.count;
    
    
    [self.page addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];


}
- (void)pageAction:(UIPageControl *)page {

    /** 设置scroller 的偏移量. */
    
//    self.scroll.contentOffset = CGPointMake(page.currentPage * 300, 0);
    


    /** 带动画效果. */
    [self.scroll setContentOffset:CGPointMake(page.currentPage * 300, 0) animated:YES];


}

@end
