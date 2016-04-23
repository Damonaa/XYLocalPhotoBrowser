//
//  XYImagesView.m
//  XYLocalPhotoBrowser
//
//  Created by 李小亚 on 16/4/22.
//  Copyright © 2016年 李小亚. All rights reserved.
//

#import "XYImagesView.h"
#import "XYLocalPhotoBrowserController.h"
#import "XYPhoto.h"

@interface XYImagesView ()
/**
 *  存放全部的图片
 */
@property (nonatomic, strong) NSMutableArray *images;
@end

@implementation XYImagesView

- (NSMutableArray *)images{
    if (!_images) {
        _images = [NSMutableArray array];
    }
    return _images;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupImages];
    }
    return self;
}
//向View上添加图片
- (void)setupImages{
    NSInteger count = 4;
    for (NSInteger i = 0; i < count; i ++) {
        NSString *image = [NSString stringWithFormat:@"%ld.jpg", i + 1];
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
        [self addSubview:iv];
        
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        iv.userInteractionEnabled = YES;
        iv.tag = self.images.count;
        
        [self.images addObject:iv];
        
        //添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagImage:)];
        [iv addGestureRecognizer:tap];
    }
}

//布局图片
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat imageWH = 70;
    CGFloat margin = 10;
    NSInteger totalColumn = 2;//共两列
    
    for (NSInteger i = 0; i < self.images.count; i ++) {
        UIImageView *iv = self.images[i];
        CGFloat row = i / totalColumn;
        CGFloat column = i % totalColumn;
        
        CGFloat imageX = margin + (imageWH + margin) * column;
        CGFloat imageY = margin + (imageWH + margin) * row;
        iv.frame = CGRectMake(imageX, imageY, imageWH, imageWH);
    }
}

//响应图片点击
- (void)tagImage:(UITapGestureRecognizer *)gesture{
    UIImageView *iv = (UIImageView *)gesture.view;
    
    //将图片转换为XYPhoto模型，存到数组中
    NSMutableArray *photos = [NSMutableArray array];
    
    for (UIImageView *iv in self.images) {
        XYPhoto *photo = [[XYPhoto alloc] init];
        photo.image = iv.image;
        photo.index = iv.tag;
        photo.srcImageView = iv;
        [photos addObject:photo];
    }
    
    //弹出图片浏览器
    XYLocalPhotoBrowserController *localBC = [[XYLocalPhotoBrowserController alloc] init];
    localBC.photos = photos;
    localBC.currentPhotoIndex = iv.tag;
    [localBC show];
}


@end
