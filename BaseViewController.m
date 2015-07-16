//
//  BaseViewController.m
//  March_23_ScrollView
//
//  Created by Guang on 3/24/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import "BaseViewController.h"
#import "ChildViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:(UIPageViewControllerTransitionStyleScroll) navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    ChildViewController * initialViewController = [self viewControllerAtIndex:0];
    
    NSArray * viewControllers = [NSArray arrayWithObjects:initialViewController, nil];
    
    
    [self.pageController setViewControllers: viewControllers direction: UIPageViewControllerNavigationDirectionForward animated: NO completion: nil];
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(ChildViewController*)viewControllerAtIndex:(NSUInteger)index{
    ChildViewController *childViewController = [[ChildViewController alloc] initWithNibName:@"ChildViewController" bundle:nil];
    childViewController.index = index;
    return childViewController;
}

-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = [(ChildViewController*)viewController index];
    if (index == 0){
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}


-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = [(ChildViewController *)viewController index];
    
    index++;
    
    if (index == 3){
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return 3;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
}

@end

