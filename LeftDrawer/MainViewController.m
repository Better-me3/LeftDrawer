//
//  MainViewController.m
//  LeftDrawer
//
//  Created by pg on 15/9/26.
//  Copyright (c) 2015年 cai. All rights reserved.
//

#import "MainViewController.h"
#import "LeftView.h"
#import "LeftSortsViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) LeftView *leftVC;
@property (nonatomic, strong) UIScrollView *scrollView;

@end
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kMainPageDistance   100   //打开左侧窗时，中视图(右视图)露出的宽度
#define kMainPageScale   0.8  //打开左侧窗时，中视图(右视图）缩放比例
#define kMainPageCenter  CGPointMake(kScreenWidth + kScreenWidth * kMainPageScale / 2.0 - kMainPageDistance, kScreenHeight / 2)  //打开左侧窗时，中视图中心点


@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    
//    self.scrollView.frame = [UIScreen mainScreen].bounds;
//    self.scrollView.backgroundColor  = [UIColor purpleColor];
//    self.scrollView.contentSize = CGSizeMake(kScreenWidth * 2, kScreenHeight);
//    [self.view addSubview:self.scrollView];

    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"抽屉" style:nil target:self action:@selector(handleDrawer:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.leftVC = [[LeftView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, 300, [UIScreen mainScreen].bounds.size.height )];
    
//    self.leftVC.view.center = CGPointMake(kScreenWidth / 2, self.view.bounds.size.height);
    [self.view addSubview:self.leftVC];
    
    
}




- (void)handleDrawer:(UIBarButtonItem *)sender {
    [[LeftView class] animateWithDuration:0.2 animations:^{
        
        
        CGPoint center = self.leftVC.center;
        center.x += kScreenWidth / 2;
        self.leftVC.center = center;
       // self.scrollView.contentOffset = CGPointMake(-kScreenWidth, 0);
        
        self.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7);
        self.view.center = CGPointMake(kScreenWidth - 300, kScreenHeight / 2);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
