//
//  FISShoppingCart.h
//  iOShoppingCart
//
//  Created by Erica on 6/8/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject


@property (nonatomic,strong)NSMutableArray *items;

-(NSInteger)calculateTotalPriceInCents;

-(void)addItem: (FISItem *)item;

-(void)removeItem:(FISItem *)item;

-(void)removeAllItemsLikeItem: (FISItem *)item;

-(void)sortItemsByNameAsc;

-(void)sortItemsByNameDesc;

-(void)sortItemsByPriceInCentsAsc;

-(void)sortItemsByPriceInCentsDesc;


-(NSArray *)allItemsWithName: (NSString *)name;

-(NSArray *)allItemsWithMinimumPriceInCents: (NSUInteger)minimumCents;

-(NSArray *)allItemsWithMaximumPriceInCents: (NSUInteger)maximumCents;






@end
