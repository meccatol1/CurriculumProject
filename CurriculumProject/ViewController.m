//
//  ViewController.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 16..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

#import "Human+Mouse.h"

@implementation Human
-(id)initWithName:(NSString *)name age:(int)age
{
    self = [super init]; //NSObject를 초기화해서 현재 클래스에 저장
    if (self) { //슈퍼 클래스의 인스턴스가 반환된 경우
        self.name = name;
        self.age = age;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    NSLog(@"copyWithZone");
    Human *human = [[[self class] allocWithZone:zone] init];
    [human setName:self.name];
    [human setAge:self.age];
    
    return human;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%p> name:[%@], age:[%zd]", self, _name, _age];
}
- (void)speak {
    NSLog(@"왈!");
}
@end

@interface ViewController () {
    
}
@property (readwrite, atomic, strong) NSObject *object1;
@property NSObject *object2;

@end

//@interface ViewController () {
//    NSObject * __weak ivar_weak_object;
//}
//@property (assign) NSObject *assignObject1;
//@property (unsafe_unretained) NSObject *assignObject2;
//
//@end

//@interface ViewController () {
//    NSString * __weak ivar_string;
//}
//@property NSString *string;
//@end

@implementation ViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    Human *human1 = [[Human alloc] initWithName:@"데이빗" age:50];
    Human *human2 = [human1 copy];
    NSLog(@"human1 = %@", human1);
    NSLog(@"human2 = %@", human2);
    
    [human1 setCountry:@"us"];
    for (int i = 0; i < 1000; i++) {
        [human1 speak];
    }
    
    
    // weak 와 unsafe_unretained 테스트
//    __weak NSObject *local_weak_object;
//    
//    __unsafe_unretained NSObject *local_assign_object;
//    NSObject * __unsafe_unretained local_assign_object2;
//    
//    NSObject *someObject = [[NSObject alloc] init];
//    NSLog(@"someObject = %@", someObject);
//    local_weak_object = someObject;
//    ivar_weak_object = someObject;
//    local_assign_object = someObject;
//    [self setAssignObject:someObject];
//    NSLog(@"local_weak_object = %@", local_weak_object);
//    NSLog(@"ivar_weak_object = %@", ivar_weak_object);
//    NSLog(@"local_assign_object = %@", local_assign_object);
//    NSLog(@"self.assignObject = %@", self.assignObject);
//    someObject = nil;
//    NSLog(@"local_weak_object = %@", local_weak_object);
//    NSLog(@"ivar_weak_object = %@", ivar_weak_object);
////    NSLog(@"local_assign_object = %@", local_assign_object2);
//    NSLog(@"self.assignObject = %@", self.assignObject);
    
    //// Local variable의 strong test
//    NSString *originalString = self.string;
//    ivar_string = self.string;
//    self.string = @"NOT ORIGINAL";
//    
//    NSLog(@"originalString = %@", originalString);
//    NSLog(@"ivar_string = %@", ivar_string);
//    NSLog(@"self.string = %@", self.string);
    
    
    //// 초기화 되지 않은 로컬 인스턴스 변수의 nil 여부
//    NSString *adsflkjafsd = @"asdlfjsjakl";
//    NSInteger random = arc4random()%123489;
//    NSLog(@"random = %zd", random);
//    
//    int integer;
//    NSLog(@"integer = %zd", integer);
//    
//    id object = nil;
//    NSLog(@"object = %@", object);
//    [object removeAllObjects];
//    NSLog(@"object = %@", object);
//    
//    SubViewController *subViewController;
//    NSLog(@"subViewController = %@", subViewController);
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    NSLog(@"ivar_string = %@", ivar_string);
    
//    int integer2;
//    NSLog(@"integer2 = %zd", integer2);
//    [self performSelector:@selector(test) withObject:nil afterDelay:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
//    NSLog(@"ivar_string = %@", ivar_string);
}
- (IBAction)action:(UIButton *)sender {
//    NSLog(@"ivar_string = %@", ivar_string);
}
@end