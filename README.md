# XYLocalPhotoBrowser
本框架根据MJPhotoBrowser的源码进行的修改，MJPhotoBrowser可以用于来源网络上的图片的浏览，我在写一个自己的应用事，需要放大浏览本地的图片，所以对MJPhotoBrowser进行的删减修改. 本框架仅仅用于浏览本地的图片，使用方法和MJPhotoBrowser相同
 使用方法：需要导入
 #import "XYLocalPhotoBrowserController.h"
 #import "XYPhoto.h"
 将需要浏览的图片转换为模型XYPhoto，将所有的图片模型存到数组中，传给XYLocalPhotoBrowserController的NSArray *photos
 修改退出图片浏览器的时间, 默认0.35
 XYPhotosView.h 
 //隐藏图片，退出图片浏览器的时间
 #define kHidenDuration 0.35

 
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
