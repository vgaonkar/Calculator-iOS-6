//
//  calculations.h
//  calculator
//
//  Created by iOS Student on 2/19/13.
//  Copyright (c) 2013 iOS Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calculations : NSObject

@property (nonatomic) double result;
@property (nonatomic) double currentValue;
@property (nonatomic) int prevOperation;
@property (nonatomic) int counter;
@property (nonatomic) int prevTag;
-(void) performMathOperations:(int)tag :(double)screenValue;
@property (nonatomic) BOOL lastEqual;
@end
