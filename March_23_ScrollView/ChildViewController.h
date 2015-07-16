

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "FooterCollectionReusableView.h"

@interface ChildViewController : UIViewController <UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UILabel *screenNumber;
@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
//@property (strong, nonatomic) IBOutlet UILabel *headerOne;

@end
