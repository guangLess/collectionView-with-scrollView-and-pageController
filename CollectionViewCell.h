

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *cellNumber;
@property (assign, nonatomic) NSIndexPath *cellindex;
@property (strong, nonatomic) IBOutlet UIImageView *cellImage;

//@property (assign, nonatomic) int cellindex;


//-(void)setAsset:(ALAsset*)asset;

//-(void)displayNumber:(NSInteger*)cellindex;
@end
