//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Zain Nadeem on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"
#import "FISTrivium.h"

@implementation FISLocation

-(instancetype)init{
    self = [self initWithName:@"" latitude:0 longitude:0];
    return self;
}

-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    self = [super init];
    
    _name = name;
    _latitude = latitude;
    _longitude = longitude;
    
    _trivia = [[NSMutableArray alloc]initWithArray:@[]];
    
    return self;
}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length{
    NSString *stringByTruncatingName;
    if (length < self.name.length){
        stringByTruncatingName = [self.name substringToIndex:length];
    }else{
        stringByTruncatingName = self.name;
    }
    return stringByTruncatingName;
}

-(BOOL)hasValidData{
    BOOL hasValidData;
    if (([self.name isEqualToString:@""]) || !(self.name)){
        hasValidData = NO;
    }else if ((self.latitude > 90.0)||(self.latitude < -90.0)){
        hasValidData = NO;
    }else if((self.longitude > 180.0)||(self.longitude <= -180.0)){ 
        hasValidData = NO;
    }else{
        hasValidData = YES;
    }
    return hasValidData;
}

-(FISTrivium *)triviumWithMostLikes{
    if([self.trivia isEqualToArray:@[]]){
        return nil;
    }
    
    NSSortDescriptor *sortByMostLikes = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    NSArray *arrayWithMostLikesToLeastLikes = [self.trivia sortedArrayUsingDescriptors: @[sortByMostLikes]];
    return arrayWithMostLikesToLeastLikes[0];
    
}
@end
