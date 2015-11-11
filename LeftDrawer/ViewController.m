//
//  ViewController.m
//  LeftDrawer
//
//  Created by pg on 15/9/25.
//  Copyright (c) 2015年 cai. All rights reserved.
//

#import "ViewController.h"
#import "LeftView.h"
#import "LeftSortsViewController.h"

@interface ViewController ()
@property (nonatomic, strong) LeftSortsViewController *leftVC;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kMainPageDistance   100   //打开左侧窗时，中视图(右视图)露出的宽度
#define kMainPageScale   0.8  //打开左侧窗时，中视图(右视图）缩放比例
#define kMainPageCenter  CGPointMake(kScreenWidth + kScreenWidth * kMainPageScale / 2.0 - kMainPageDistance, kScreenHeight / 2)  //打开左侧窗时，中视图中心点

@implementation ViewController

- (IBAction)handleDrawer:(UIBarButtonItem *)sender {
    [[LeftView class] animateWithDuration:0.2 animations:^{
        
        
        CGPoint center = self.leftVC.view.center;
        center.x += kScreenWidth / 2;
        self.leftVC.view.center = center;
        self.scrollView.contentOffset = CGPointMake(-kScreenWidth, 0);
        
        self.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7);
        self.view.center = CGPointMake(kScreenWidth - 200, kScreenHeight / 2);
    }];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor = [UIColor yellowColor];
    
    self.scrollView.frame = [UIScreen mainScreen].bounds;
    self.scrollView.backgroundColor  = [UIColor purpleColor];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * 2, kScreenHeight);
    [self.view addSubview:self.scrollView];
    self.leftVC = [[LeftSortsViewController alloc] init];
    
    self.leftVC.view.center = CGPointMake(kScreenWidth / 2, self.view.bounds.size.height);
    [self.scrollView addSubview:self.leftVC.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
