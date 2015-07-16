

//Possible Wiki aip ex : http://en.wikipedia.org/w/index.php?title=Wikipedia:Picture_of_the_day&action=raw  //raw// http://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvprop=content&rvsection=0&titles=Wikipedia:Picture_of_the_day
//


#import "ChildViewController.h"



@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //to identify the screen page. self.index
    self.screenNumber.text = [NSString stringWithFormat:@"s #%ld", (long)self.index];

    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"HeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"HeaderCollectionView"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"FooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterCollectionView"];
    
    //register either from a registerClass or register from the nib file which is similar to the cell.
    //[self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterCollectionView"];
}

#pragma mark collection view data source delegate methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}


- (CollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    if (indexPath.section == 0){

    cell.cellNumber.text = [NSString stringWithFormat:@"%ld :D nice", (long)indexPath.row];
    //cell.cellImage.image = [UIImage imageNamed:@"cellImage.jpg"];
    }
    else {
        cell.cellNumber.text = [NSString stringWithFormat:@"%ld :D sec2", (long)indexPath.row];
    }
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    HeaderCollectionReusableView *reusableview = nil;
    FooterCollectionReusableView *reusableViewF = nil;

    
    if (kind == UICollectionElementKindSectionHeader){
        
        HeaderCollectionReusableView * reusableViewHeader = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderCollectionView" forIndexPath:indexPath];

        //reusableview.label.text  = @"Section One Header";
        reusableViewHeader.label.text = [NSString stringWithFormat:@"Header Section #%ld",(long)indexPath.section];
        reusableViewHeader.label.textColor = [UIColor whiteColor];
        reusableview = reusableViewHeader;
        return reusableview;

    }
    else {
        // if nothing is needed for the footer file than els only need to return a footer
        FooterCollectionReusableView * reusableViewFooter = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterCollectionView" forIndexPath:indexPath];
        
        //reusableViewFooter.footerImage.contentMode = UIViewContentModeScaleAspectFit;
        reusableViewFooter.footerImage.image = [UIImage imageNamed:@"ROTA.jpg"];

        reusableViewFooter.footerText.text = [NSString stringWithFormat:@"Footer section #%ld",(long)indexPath.section];
        //reusableview.headerImage = [UIImage imageNamed:@"cellImage.jpg"];
        reusableViewF = reusableViewFooter;
        return reusableViewF;
    }

    //return reusableview;
}


//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
//    
//    if (indexPath.section == 0){
//    }else {
//        
//    }
//    return
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











