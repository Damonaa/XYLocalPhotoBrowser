//
//  XYPhotosView.h
//  XYLocalPhotoBrowser
//
//  Created by 李小亚 on 16/4/23.
//  Copyright © 2016年 李小亚. All rights reserved.
//

//隐藏图片，退出图片浏览器的时间
#define kHidenDuration 0.35

#import <UIKit/UIKit.h>

@class XYPhoto, XYPhotosView;

@protocol XYPhotosViewDelegate <NSObject>
@optional
- (void)photoViewImageFinishLoad:(XYPhotosView *)photoView;
- (void)photoViewSingleTap:(XYPhotosView *)photoView;


- (void)photoViewDidEndZoom:(XYPhotosView *)photoView;
@end


@interface XYPhotosView : UIScrollView

@property (nonatomic, strong) XYPhoto *photo;

// 代理
@property (nonatomic, weak) id<XYPhotosViewDelegate> photoViewDelegate;
@end
