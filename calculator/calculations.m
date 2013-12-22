//
//  calculations.m
//  calculator
//
//  Created by iOS Student on 2/19/13.
//  Copyright (c) 2013 iOS Student. All rights reserved.
//

#import "calculations.h"

@implementation calculations

-(void) performMathOperations:(int)tag :(double)screenValue
{
    
    switch (self.counter) {
        //executes when the calculator is first started or when "equal to" sign is pressed
        case 0:
        {
            if (tag == 13 || (tag==12 && self.prevOperation == 13))
            {
                self.result = screenValue;
                self.prevTag=self.prevOperation = 13;
            }
            else if (tag == 14 || (tag==12 && self.prevOperation == 14))
            {
                self.result = screenValue;
                self.prevTag=self.prevOperation = 14;
            }
            
            else if (tag == 15 || (tag==12 && self.prevOperation == 15))
            {
                
                self.result = screenValue;
                self.prevTag=self.prevOperation = 15;
            }
            
            else if (tag == 16 || (tag==12 && self.prevOperation == 16))
            {
                self.result = screenValue;
                self.prevTag=self.prevOperation = 16;
            }
            
            self.counter++;
            break;
        }
         
        //executes for all subsequent cases
        default:
        {
            self.lastEqual=NO;
            // addition and addition
            if (tag == 13 && self.prevOperation == 13)
            {
                self.result = self.result + screenValue;
                self.prevOperation = 13;
                self.prevTag=self.prevOperation;
            }
            
            //subtraction and subtraction
            else if (tag == 14 && self.prevOperation == 14)
            {
                self.result = self.result - screenValue;
                self.prevOperation = 14;
            }
            
            //multiplication and multiplication
            else if (tag == 15 && self.prevOperation == 15)
            {
                self.result = self.result * screenValue;
                self.prevOperation = 15;
            }
            
            //division and division
            else if (tag == 16 && self.prevOperation == 16)
            {
                self.result = self.result / screenValue;
                self.prevOperation = 16;
            }
            
            //addition and subtraction
           else if (tag == 13 && self.prevOperation == 14)
            {
                self.result = self.result - screenValue;
                self.prevOperation = 13;
            }
            
            //addition and multiplication
            else if (tag == 13 && self.prevOperation == 15)
            {
                self.result = self.result * screenValue;
                self.prevOperation = 13;
            }
            
            //addition and division
            else if (tag == 13 && self.prevOperation == 16)
            {
                self.result = self.result / screenValue;
                self.prevOperation = 13;
            }
            
            //subtraction and addition
            else if (tag == 14 && self.prevOperation == 13)
            {
                self.result = self.result + screenValue;
                self.prevOperation = 14;
            }
            
            //subtraction and multiplication
            else if (tag == 14 && self.prevOperation == 15)
            {
                self.result = self.result * screenValue;
                self.prevOperation = 14;
            }
            
            //subtraction and divison
            else if (tag == 14 && self.prevOperation == 16)
            {
                self.result = self.result / screenValue;
                self.prevOperation = 14;
            }
            
            //multiplication and addition
            else if (tag == 15 && self.prevOperation == 13)
            {
                self.result = self.result + screenValue;
                self.prevOperation = 15;
            }
            
            //multiplication and subtraction
            else if (tag == 15 && self.prevOperation == 14)
            {
                self.result = self.result - screenValue;
                self.prevOperation = 15;
            }
            
            //multiplication and division
            else if (tag == 15 && self.prevOperation == 16)
            {
                self.result = self.result / screenValue;
                self.prevOperation = 15;
            }
            
            //division and addition
            else if (tag == 16 && self.prevOperation == 13)
            {
                self.result = self.result + screenValue;
                self.prevOperation = 16;
            }
            
            //division and subtraction
            else if (tag == 16 && self.prevOperation == 14)
            {
                self.result = self.result - screenValue;
                self.prevOperation = 16;
            }
            
            //division and multiplication
            else if (tag == 16 && self.prevOperation == 15)
            {
                self.result = self.result * screenValue;
                self.prevOperation = 16;
            }
            self.counter++;
            
            //Equals to button
            if (tag == 12)
            {
                if (self.prevOperation == 13)
                    self.result = self.result + screenValue;
                
                else if (self.prevOperation == 14)
                    self.result = self.result - screenValue;
                
                else if (self.prevOperation == 15)
                    self.result = self.result * screenValue;
                
                else if (self.prevOperation == 16)
                    self.result = self.result / screenValue;
                screenValue=0;
                self.prevOperation=12;
                self.counter = 0;
            }
            break;
        }
    }
    
      //Clear button
    if (tag == 20)
    {
        self.result = 0;
        self.currentValue = 0;
        self.prevOperation = 0;
        screenValue = 0;
        self.prevTag = 0;
        self.counter = 0;
        self.lastEqual = 0;
    }
    


}
@end
