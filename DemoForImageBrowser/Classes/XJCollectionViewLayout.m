//
//  XJCollectionViewLayout.m
//  DemoForImageBrowser
//
//  Created by Silence on 16/1/7.
//  Copyright © 2016年 silence. All rights reserved.
//

#import "XJCollectionViewLayout.h"

#define kInteritemSpacing       30 // item 间隙

@interface XJCollectionViewLayout ()



@end
@implementation XJCollectionViewLayout
- (void)prepareLayout {
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat viewWidth = self.collectionView.bounds.size.width;
    CGFloat viewHeight = self.collectionView.bounds.size.height;
    self.itemSize = CGSizeMake(viewWidth , viewHeight - 120);
    self.minimumLineSpacing = kInteritemSpacing;
    self.sectionInset = UIEdgeInsetsMake(150, 0, 150, 0);
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGPoint point = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
    NSLog(@"point = %@  Offset = %@ velocity= %@", NSStringFromCGPoint(point), NSStringFromCGPoint(proposedContentOffset), NSStringFromCGPoint(velocity));
    return point;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];
    
    return attributesArray;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
@end
