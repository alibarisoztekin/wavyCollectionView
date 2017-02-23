//
//  WavyFlowLayout.m
//  WavyCollectionView
//
//  Created by Ali Barış Öztekin on 2017-02-23.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "WavyFlowLayout.h"

@implementation WavyFlowLayout

-(void)prepareLayout
{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray<UICollectionViewLayoutAttributes*>* superAttributes = [super layoutAttributesForElementsInRect:rect];
   
    NSMutableArray<UICollectionViewLayoutAttributes*>* newAttributes = [NSMutableArray new];
    [newAttributes addObjectsFromArray:superAttributes];
   
    CGFloat collectionViewHeight =  self.collectionView.frame.size.height;
    
    for (UICollectionViewLayoutAttributes* attribute in newAttributes) {
    
        CGFloat dY = arc4random_uniform(collectionViewHeight- self.itemSize.height);

        
        attribute.frame = CGRectMake(attribute.frame.origin.x, dY, self.itemSize.width, ((collectionViewHeight-dY)/100)*self.itemSize.height);
        
        
    }
 
    
    
    
    return newAttributes;
    
}
@end
