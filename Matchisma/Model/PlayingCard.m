//
//  PlayingCard.m
//  Matchisma
//
//  Created by 谷琪 on 2020/4/3.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if ([self.suit isEqualToString:otherCard.suit]){
            score = 1;
        }else if (self.rank == otherCard.rank){
            score = 4;
        }
    }
    return score;
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // because we provide setter AND getter

+ (NSArray *)validSuits
{
    return @[@"♥︎",@"♦︎",@"♠︎",@"♣︎"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSInteger)maxRank
{
    return [[self rankStrings] count]-1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end