//
//  Photo.m
//  UI_轮播图
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "Photo.h"

@interface Photo ()<UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *scorll;
@property (nonatomic, retain) UIPageControl *page;
@property (nonatomic, retain) NSMutableArray *arrImages;


@end

@implementation Photo

- (void)dealloc {
    [_scorll release];
    [_page release];
    [_arrImages release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        /** 初始化数组, 添加对象. */
        self.arrImages = [NSMutableArray arrayWithArray:images];
        
        [self.arrImages addObject:self.arrImages.firstObject];
        
        [self.arrImages insertObject:[self.arrImages objectAtIndex:self.arrImages.count - 2]  atIndex:0];
        
        self.backgroundColor = [UIColor yellowColor];
        /** 子控件.  */
        [self createScrollWithFrame:frame];
    }
    
    return self;
    
}


- (void)createScrollWithFrame:(CGRect)frame {
    
    self.scorll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    [self addSubview:self.scorll];
    [_scorll release];
    
    self.scorll.contentSize = CGSizeMake(frame.size.width * self.arrImages.count, frame.size.height);
    self.scorll.pagingEnabled = YES;
    self.scorll.backgroundColor = [UIColor lightGrayColor];
    
    [self createImageViewsWithFrame:frame];
    
    self.scorll.contentOffset = CGPointMake(frame.size.width, 0);
    
    /** 指定代理人. */
    self.scorll.delegate = self;
    
}
- (void)createImageViewsWithFrame:(CGRect)frame {
    
    for (int i = 0; i < self.arrImages.count; i++) {
        
        /** 创建小scrollView */
        UIScrollView *scrollSmall = [[UIScrollView alloc] initWithFrame:CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height)];
        
        [self.scorll addSubview:scrollSmall];
        [scrollSmall release];
        
        
        /** 小scrollView缩放功能. */
        scrollSmall.delegate = self;
        scrollSmall.minimumZoomScale = 0.5;
        scrollSmall.maximumZoomScale = 2;
        
        
        /** 在每个小scrollView上面添加一个ImageView. */
        NSString *name = self.arrImages[i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
        imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [scrollSmall addSubview:imageView];
        [imageView release];
        
        imageView.userInteractionEnabled = YES;
    }
    
}


#pragma mark - Scroll Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    /** 轮播效果 */
    if (scrollView.contentOffset.x == 0) {
        [self.scorll setContentOffset:CGPointMake(self.frame.size.width * (self.arrImages.count - 2), 0)];
    }
    
    if (scrollView.contentOffset.x == self.frame.size.width * (self.arrImages.count - 1)) {
        
        [self.scorll setContentOffset:CGPointMake(self.frame.size.width, 0)];
    }
    
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return scrollView.subviews.firstObject;
    
}



@end
