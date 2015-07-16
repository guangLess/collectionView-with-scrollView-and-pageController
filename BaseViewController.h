//
//  BaseViewController.h
//  March_23_ScrollView
//
//  Created by Guang on 3/24/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildViewController.h"
#import "CollectionViewCell.h"

@interface BaseViewController : UIViewController<UIPageViewControllerDataSource,UICollectionViewDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;


@end
