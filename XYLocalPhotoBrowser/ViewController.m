//
//  ViewController.m
//  XYLocalPhotoBrowser
//
//  Created by 李小亚 on 16/4/22.
//  Copyright © 2016年 李小亚. All rights reserved.
//

#import "ViewController.h"
#import "XYImagesView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XYImagesView *imagesView = [[XYImagesView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 200)];
    imagesView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imagesView];

}


@end
