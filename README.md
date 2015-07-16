Sample of customized CollectionView: 

customize footer/header
  Initialize with NibName

    [self.collectionView registerNib:[UINib nibWithNibName:@"HeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"HeaderCollectionView"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterCollectionView"];


 configure footer/header in the following method
 
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
    
    
 customized the CELL  
 
     [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
 configure the CELL
 
       - (CollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

      CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
      if (indexPath.section == 0){

      cell.cellNumber.text = [NSString stringWithFormat:@"%ld :D nice", (long)indexPath.row];
      //cell.cellImage.image = [UIImage imageNamed:@"cellImage.jpg"];
      }
      else {
        cell.cellNumber.text = [NSString stringWithFormat:@"%ld :D section 2", (long)indexPath.row];
      }
      return cell;
      }


