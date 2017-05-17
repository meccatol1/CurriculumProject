//
//  ViewController.h
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 16..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Human : NSObject <NSCopying>

-(id)initWithName:(NSString *)name age:(int)age;

@property (retain, nonatomic) NSString *name;
@property (assign, nonatomic) int age;

//- (void)speak;

@end
@protocol NewWorld

@end

@protocol HelloWorld <NSObject, NewWorld>
// NSObject Protocol을 따르는 Helloworld Protocol
@property NSString *helloString;
@optional
- (void)printHelloString;
@end

@interface ViewController : UIViewController
@property (weak) id <HelloWorld> delegate;

@end



