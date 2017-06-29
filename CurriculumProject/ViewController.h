//
//  ViewController.h
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 16..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZBlockKeeper : NSObject
@property (copy) void (^block)(void);
- (void)print;
@end

@interface Human : NSObject <NSCopying> {
    NSString *problem;
}

- (id)initWithName:(NSString *)name age:(int)age;
- (void)changeName:(NSString *)name;
- (void)changeAge:(int)age;
- (void)eat;

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

@interface ViewController : UIViewController {
    NSString *rewards;
}
@property NSString *temperature;
@property (weak) id <HelloWorld> delegate;

//- (void)printThisString:(NSString *)__string;
- (void)printThisStringAndFix:(NSString **)__string;
- (void)emptyMethod;
- (void)emptyMethod2;
- (void)iteratorMethod;


- (IBAction)unwindToRoot:(UIStoryboardSegue*)unwindSegue;

@end



