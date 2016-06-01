//
//  AppDelegate.m
//  ios-prework-objc-assessment
//
//  Created by Joel Bell on 5/23/16.
//  Copyright © 2016 Joel Bell. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *numbersArray = @[];
    NSArray *lettersArray = @[];
    NSDictionary *alphabetDictionary = @{};
    
    numbersArray = [self generateArrayOfNumbers];
    lettersArray = [self generateArrayOfLetters];
    alphabetDictionary = [self generateNumbersAndLettersDictionaryWithNumbers:numbersArray letters:lettersArray];
    
    for (int i=0; i < [numbersArray count]; i++) {
        NSLog(@"%@ : %@", numbersArray[i], alphabetDictionary[numbersArray[i]]);
    }
    
    /*
     Alternative logging with no guarantee of ordered dictionary log:
     NSLog(@"%@",alphabetDictionary);
    */
    
    numbersArray = [alphabetDictionary allKeys];
    
    NSMutableArray *mutableLettersArray = [lettersArray mutableCopy];
    [mutableLettersArray removeAllObjects];
    
    for (NSNumber *key in alphabetDictionary) {
        [mutableLettersArray addObject:alphabetDictionary[key]];
    }
    
    NSLog(@"%@\n%@",numbersArray,mutableLettersArray);
    
    return YES;
}

- (NSArray *)generateArrayOfNumbers {
    NSMutableArray *mNumbersArray = [[NSMutableArray alloc] init];
    for (int i=1; i <= 26; i++) {
        [mNumbersArray addObject:@(i)];
    }
    return [mNumbersArray copy];
}

- (NSArray *)generateArrayOfLetters {
    NSMutableArray *mLettersArray = [[NSMutableArray alloc] init];
    for (char c = 'a'; c <= 'z'; c++) {
        [mLettersArray addObject:[NSString stringWithFormat:@"%c",c]];
    }
    return [mLettersArray copy];
}

- (NSDictionary *)generateNumbersAndLettersDictionaryWithNumbers:(NSArray *)numbersArray letters:(NSArray *)lettersArray {
    NSMutableDictionary *mAlphabetDictionary = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < [numbersArray count]; i++) {
        mAlphabetDictionary[numbersArray[i]] = lettersArray[i];
    }
    return [mAlphabetDictionary copy];
}


@end
