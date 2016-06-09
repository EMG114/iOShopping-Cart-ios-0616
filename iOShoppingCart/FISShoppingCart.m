//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Erica on 6/8/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart




-(NSInteger)calculateTotalPriceInCents {
    NSUInteger itemTotalPriceInCents = 0;
      for (FISItem *item in self.items) {
               itemTotalPriceInCents += item.priceInCents;
           }
       return itemTotalPriceInCents;
    
}

-(void)addItem: (FISItem *)item{
    
    [self.items addObject:item];
    
}

-(void)removeItem:(FISItem *)item{
    
    NSUInteger indexOfItem = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:indexOfItem];
    
}



-(void)removeAllItemsLikeItem: (FISItem *)item{
    
    [self.items removeObject:item];
    
}

-(void)sortItemsByNameAsc{
    
    NSSortDescriptor *sortByAscending = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        [self.items sortUsingDescriptors:@[sortByAscending]];
    
}

-(void)sortItemsByNameDesc{
    
    NSSortDescriptor *sortByDescending = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
        [self.items sortUsingDescriptors:@[sortByDescending]];
    
}

-(void)sortItemsByPriceInCentsAsc{
    
    NSSortDescriptor *sortByAscendingPrice = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    [self.items sortUsingDescriptors:@[sortByAscendingPrice]];
    
}

-(void)sortItemsByPriceInCentsDesc{
    
    
    NSSortDescriptor *sortByDescendingPrice = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    [self.items sortUsingDescriptors:@[sortByDescendingPrice]];
    
}


-(NSArray *)allItemsWithName: (NSString *)name {
//    NSArray *allItemsWithName = [NSArray new];
//    NSMutableArray *allItemsWithNameMUtable =[allItemsWithName mutableCopy];
//      [self.items addObjectsFromArray:allItems];
//    Will return to this SOLUTION Later...
    
    NSPredicate *nameItemsPredicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    NSArray *allItemsWithName = [self.items filteredArrayUsingPredicate:nameItemsPredicate];
    return allItemsWithName;
}

-(NSArray *)allItemsWithMinimumPriceInCents: (NSUInteger)minimumCents {
    
    
    NSPredicate *priceItemsMinimumPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", minimumCents];
        return [self.items filteredArrayUsingPredicate:priceItemsMinimumPricePredicate];
}

-(NSArray *)allItemsWithMaximumPriceInCents: (NSUInteger)maximumCents {
    
    
    NSPredicate *priceItemsMaximumPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", maximumCents];
    return [self.items filteredArrayUsingPredicate:priceItemsMaximumPricePredicate];
}








@end
