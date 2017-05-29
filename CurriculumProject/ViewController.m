//
//  ViewController.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 16..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"
#import "ForwardingObject.h"

#import <objc/runtime.h>

#import <objc/runtime.h>

//#import "Human+Mouth.h"

@implementation XYZBlockKeeper
- (void)configureBlock {
    XYZBlockKeeper * __weak weakSelf = self;
    self.block = ^{
//        [self print]; // strong reference cycle
        [weakSelf print];
        
//        [self print];
        // capturing a strong reference to self
        // creates a strong reference cycle
    };
}
- (void)print {
    NSLog(@"print");
}
@end

@implementation Human
-(id)initWithName:(NSString *)name age:(int)age
{
    self = [super init]; //NSObject를 초기화해서 현재 클래스에 저장
    if (self) { //슈퍼 클래스의 인스턴스가 반환된 경우
        self.name = name;
        self.age = age;
        problem = @"what is your problem?";
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
//- (void)speak {
//    NSLog(@"왈!");
//}
@end

typedef void (^BinBlock)(void);

@interface ViewController () {
    
}
@property ForwardingObject *otherObject;

@end


//@property (strong) BinBlock propertyBlock;
//@property (copy) BinBlock propertyBlock2;
//
//@property (readwrite, atomic, strong) NSObject *object1;
//@property NSObject *object2;
//
//@end

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

typedef struct {
    int i;
    float f;
} MyIntegerFloatStruct;

@implementation ViewController
//@synthesize helloString;

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

void function1(id self, SEL _cmd) {
    ViewController *realSelf = self;
    
    NSString *realRewards = realSelf->rewards;
}
void function(id self, SEL _cmd) {
    NSLog(@"function is dynamically called");
    NSLog(@"_cmd = %@", NSStringFromSelector(_cmd));
    // implementation ....
    ViewController *realSelf = self;
    realSelf.temperature = @"27도!!";
    
    NSLog(@"temperature = %@", realSelf.temperature);
}
//
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod = %@", NSStringFromSelector(sel));
    if (sel == @selector(resolveThisMethodDynamically)) {
        return class_addMethod([self class], sel, (IMP)function, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}

typedef struct example {
    char *aString;
    int  anInt;
} Example;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [NSThread currentThread]);
    
    
    id protocol = objc_getProtocol("asdf");
    NSLog(@"protocol = %@", protocol);
    
    id LenderClass = objc_getClass("ViewController");
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
    }

    
    
//    NSOperation *o = [[NSOperation alloc] init];
//    o.isCancelled = NO;
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperations:<#(nonnull NSArray<NSOperation *> *)#> waitUntilFinished:<#(BOOL)#>]
    
    //// NSBlockOperation and Separate thread
//    __block int total = 100;
//    
//    NSBlockOperation *o1 = [NSBlockOperation blockOperationWithBlock:^{
//        for (int i = 1; i <= total; i++) {
//            NSLog(@"[o1_1] i = %zd, %@", i, [NSThread currentThread]);
//        }
//    }];
//    [o1 addExecutionBlock:^{
//        for (int i = 1; i <= total; i++) {
//            NSLog(@"[o1_2] i = %zd, %@", i, [NSThread currentThread]);
//        }
//    }];
//    [o1 addExecutionBlock:^{
//        for (int i = 1; i <= total; i++) {
//            NSLog(@"[o1_3] i = %zd, %@", i, [NSThread currentThread]);
//        }
//    }];
////    [o1 start];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue setMaxConcurrentOperationCount:1];
//    [queue addOperation:o1];
    
    //// NSInvocationOperation and Dependency
//    NSInvocationOperation *o1 = [[NSInvocationOperation alloc] initWithTarget:self
//                                                                     selector:@selector(emptyMethod)
//                                                                       object:nil];
//    NSInvocationOperation *o2 = [[NSInvocationOperation alloc] initWithTarget:self
//                                                                     selector:@selector(iteratorMethod)
//                                                                       object:nil];
//    [o1 addDependency:o2];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue setMaxConcurrentOperationCount:5];
//    [queue addOperation:o1];
//    sleep(1);
//    [queue addOperation:o2];
    
    
    ///////////////////////////////////////////////     4주차       ///////////////////////
    //// Runtime Sample
//    int type;
//    
//    id list;
//    
////    class_addMethod([self class], @selector(blahblah), (IMP)function, "v@:");
//    
//    if (type) {
//        list =
//        @[@"1", @"2"];
//    } else {
//        list =
//        [NSMutableArray arrayWithArray:@[@"1", @"2"]];
//    }
//    
//    [self methodForSelector:@selector(viewDidLoad)];
    
    
    // Messaging 예제
//    NSLog(@"perform resolveThisMethodDynamically");
//    [self performSelector:@selector(resolveThisMethodDynamically)];
//    
////    NSArray *array = @[@"1",@"1",@"1",@"1",@"1"];
//    
//    char *buf1 = @encode(int **);
//    char *buf2 = @encode(int);
//    char *buf3 = @encode(NSArray *);
//    char *buf4 = @encode(NSDictionary *);
//    char *buf5 = @encode(Example);
//    char *buf6 = @encode(NSObject);
//    char *buf7 = @encode(ViewController);
//    
//    NSLog(@"%s, %s, %s, %s, %s, %s, %s",
//          buf1, buf2, buf3, buf4, buf5, buf6, buf7);
//    
//    size_t size1 = sizeof(buf1);
//    size_t size2 = sizeof(buf2);
//    size_t size3 = sizeof(buf3);
//    NSLog(@"%lu, %lu, %lu", size1, size2, size3);

    //// Runtime Sample
//    self.otherObject = [[ForwardingObject alloc] init];
//    
//    if ([self respondsToSelector:@selector(printThisString:)]) {
//        NSLog(@"가능");
//    } else {
//        NSLog(@"불가능");
//    }
//    [self performSelector:@selector(printThisString:) withObject:@"this is forwarding"];
//    
//    NSString *fix = @"asdfasdf";
//    [self printThisStringAndFix:&fix];
    
//    [self performSelector:@selector(asdlfjasdf)];
//    [self printThisString:@"this is forwarding"];
    
//
//    [self methodForSelector:@selector(viewDidLoad)];
    
    //// ivar도 key value coding을 통해 접근이 가능하다
//    Human *human1 = [[Human alloc] initWithName:@"name" age:2];
//    NSString *problem = [human1 valueForKey:@"problem"];
//    NSLog(@"problem is = %@", problem);
//    [human1 setValue:@"메롱~" forKey:@"problem"]; // 변경됨
//    NSString *_problem = [human1 valueForKey:@"problem"];
//    NSLog(@"problem is = %@", _problem);
////    NSString *problem1 = [human1 valueForKey:@"problem1"]; // 없는 value에 접근하면 NSUnknownKeyException이 발생한다.
////    NSLog(@"problem1 is = %@", problem1);
    
    //// boolean test
//    bool boolTest1 = true;
//    if (boolTest1) {
//        NSLog(@"boolTest1");
//    }
//    boolTest1 = -10;
//    if (boolTest1) {
//        NSLog(@"Again, boolTest1");
//    }
//    if (boolTest1 == true) {
//        NSLog(@"By repeated, boolTest1");
//    }
//    if ( (-5) == true) { // 안불림
//        NSLog(@"Finally, boolTest1");
//    }
//    
//    BOOL boolTest2 = YES;
//    if (boolTest2) {
//        NSLog(@"boolTest2");
//    }
//    boolTest2 = -10;
//    if (boolTest2) {
//        NSLog(@"Again, boolTest2");
//    }
//    if (boolTest2 == YES) {
//        NSLog(@"By repeated, boolTest2");
//    }
//    if ( (-5) == YES) { // 안불림
//        NSLog(@"Finally, boolTest2");
//    }
    
//    NSInteger int1 = 10;
//    __block NSInteger int2 = 20;
//    BinBlock newBlock = ^{
//        NSLog(@"newBlock!!");
//        int2 += int1;
//        NSLog(@"int2 = %zd", int2);
//        NSLog(@"int1<%p>, int2<%p>", &int1, &int2);
//    };
//    NSLog(@"newBlock = %@ <%p>", newBlock, newBlock);
//    self.propertyBlock = newBlock;
//    NSLog(@"self.propertyBlock = %@ <%p>",
//          self.propertyBlock, self.propertyBlock);
//    newBlock();
//    self.propertyBlock2 = newBlock;
//    NSLog(@"self.propertyBlock2 = %@ <%p>",
//          self.propertyBlock2, self.propertyBlock2);
//    [self checkBlock:newBlock];
    
//    int anInteger = 42;
//    NSString *hello = @"hello";
//    NSLog(@"Integer is: %i, %@", anInteger, hello);
//    NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//    void (^testBlock)(void) = ^{
//        NSLog(@"____block started");
//        NSLog(@"Integer is: %i, %@", anInteger, hello);
//        NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//    };
//    anInteger = 84;
//    hello = @"~~~~hello~~~~";
//    testBlock();
    
    
//    int anInteger = 42;
//    NSString *hello = @"hello";
//    NSLog(@"Integer is: %i, %@", anInteger, hello);
//    NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//    void (^testBlock)(void) = ^{
//        NSLog(@"____block started");
//        NSLog(@"Integer is: %i, %@", anInteger, hello);
//        NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//        int anInteger = 20;
//        NSString *hello = @"new_hello";
//        NSLog(@"Integer is: %i, %@", anInteger, hello);
//        NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//        // Can't
////        NSLog(@"anInteger2 = %i", anInteger2);
//    };
//    int anInteger2 = 24;
//    anInteger = 84;
//    testBlock();

    
//    __block int anInteger = 42;
//    __block NSString *hello = @"hello";
//    NSLog(@"Integer is: %i, %@", anInteger, hello);
//    NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//    void (^testBlock)(void) = ^{
//        NSLog(@"____block started");
//        NSLog(@"Integer is: %i, %@", anInteger, hello);
//        NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//        anInteger = 20;
//        hello = @"new_hello";
//        NSLog(@"Integer is: %i, %@", anInteger, hello);
//        NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//    };
//    NSLog(@"Integer is: %i, %@", anInteger, hello);
//    NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//    anInteger = 84;
//    NSLog(@"Integer is: %i, %@", anInteger, hello);
//    NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
//    testBlock();
//    NSLog(@"____after block");
//    NSLog(@"Integer is: %i, %@", anInteger, hello);
//    NSLog(@"anInteger = %p, hello = %p", &anInteger, hello);
    
    // empty block
//    void (^emptyBlock)(void);
//    NSLog(@"emptyBlock = %@", emptyBlock);
//    emptyBlock();
    
    
//    void (^testBlock)(void) = ^ {
//        NSLog(@"log log log");
//    };
//    testBlock();
//
//    
//    int (^(^complexBlock)(void (^)(void))    )(void) = ^(void (^aBlock)(void)) {
//        aBlock();
//        NSLog(@"inside");
//        return ^{
//            NSLog(@"returned");
//            return 1;
//        };
//    };
//    int (^returnBlock)(void) = complexBlock(^{
//        NSLog(@"argument");
//    });
//    returnBlock();

    
//    BinBlock block1 = ^{
//        NSLog(@"creating block");
//    };
//    
//    BinBlock (^complexBlock2)(BinBlock) = ^(BinBlock aBlock) {
//        aBlock();
//        NSLog(@"inside of block");
//        return ^{
//            NSLog(@"returned block");
//            return;
//        };
//    };
//    BinBlock returnBlock2 = complexBlock2(^{
//        NSLog(@"argument block");
//    });
//    returnBlock2();
//    
//    void (^ (^complexBlock)(void (^)(void)) )(void) = ^(void (^aBlock)(void)) {
//        aBlock();
//        NSLog(@"inside of block");
//        return ^{
//            NSLog(@"returned block");
//            return;
//        };
//    };
//    void (^returnBlock)(void) = complexBlock(^{
//        NSLog(@"argument block");
//    });
//    returnBlock();
    
    // block
//    void (^arrayOfTenBlocksReturningVoidWithIntArgument[10])(int);
//    arrayOfTenBlocksReturningVoidWithIntArgument[0] = ^(int v) {
//        
//    };
//    
//    float (^oneFrom)(float);
//    
//    oneFrom = ^(float aFloat) {
//        float result = aFloat - 1.0;
//        return result;
//    };
//    
//    NSArray *stringsArray = @[ @"string 1",
//                               @"String 21", // <-
//                               @"string 12",
//                               @"String 11",
//                               @"strîng 21", // <-
//                               @"striñg 21", // <-
//                               @"String 02",
//                               @"S",
//                               @"SSSSSSSSSSSSS"];
//
//    [stringsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"obj = %@<%p>", obj, obj);
//    }];
//    
////    NSMutableArray *mutableStringArray = [stringsArray mutableCopy];
////    [mutableStringArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
////        NSLog(@"obj = %@<%p>", obj, obj);
////    }];
//    
//    NSLocale *currentLocale = [NSLocale currentLocale];
//    __block NSUInteger orderedSameCount = 0;
//    
//    NSArray *diacriticInsensitiveSortArray = [stringsArray sortedArrayUsingComparator:^(id string1, id string2) {
//        NSLog(@"1 = [%@], 2 = [%@]", string1, string2);
//        
//        NSRange string1Range = NSMakeRange(0, [string1 length]);
//        NSComparisonResult comparisonResult = [string1 compare:string2 options:NSDiacriticInsensitiveSearch range:string1Range locale:currentLocale];
//        
//        if (comparisonResult == NSOrderedSame) {
//            orderedSameCount++;
//        }
//        return comparisonResult;
//    }];
//    
//    NSLog(@"diacriticInsensitiveSortArray: %@", diacriticInsensitiveSortArray);
//    NSLog(@"orderedSameCount: %zd", orderedSameCount);
    
//    size_t count = 10;
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
//>>>>>>> 2606ee6b8f56101e931d723d4648a5dd0538bf56
    
    
    //// Block Sample!
//    void (^testBlock)(void) = ^ {
//        NSLog(@"log log log");
//    };
//    testBlock();
////    
////    (^complexBlock)(void (^)(void))
////    
//    int (^  (^complexBlock)(void (^)(void))    )(void) = ^ (void (^aBlock)(void)) {
//        aBlock();
//        NSLog(@"inside");
//        return ^{
//            NSLog(@"returned");
//            return 1;
//        };
//    };
//    int (^returnBlock)(void) = complexBlock(^{
//        NSLog(@"argument");
//    });
//    returnBlock();
//
//    
//    //안됨
//    BinBlock (^complexBlock2)(BinBlock) = ^(BinBlock _bin) {
//        return ^{
//            
//        };
//    };
//    
//    void (^arrayOfTenBlocksReturningVoidWithIntArgument[10])(int);
//    arrayOfTenBlocksReturningVoidWithIntArgument[0] = ^(int v) {
//        
//    };
//    
//    float (^oneFrom)(float);
//    
//    oneFrom = ^(float aFloat) {
//        float result = aFloat - 1.0;
//        return result;
//    };
//    
//    NSArray *stringsArray = @[ @"string 1",
//                               @"String 21", // <-
//                               @"string 12",
//                               @"String 11",
//                               @"strîng 21", // <-
//                               @"Striñg 21", // <-
//                               @"String 02",
//                               @"S",
//                               @"SSSSSSSSSSSSS"];
//    
//    NSLocale *currentLocale = [NSLocale currentLocale];
//    __block NSUInteger orderedSameCount = 0;
//    
//    NSArray *diacriticInsensitiveSortArray = [stringsArray sortedArrayUsingComparator:^(id string1, id string2) {
//        NSLog(@"1 = [%@], 2 = [%@]", string1, string2);
//        
//        NSRange string1Range = NSMakeRange(0, [string1 length]);
//        NSComparisonResult comparisonResult = [string1 compare:string2 options:NSDiacriticInsensitiveSearch range:string1Range locale:currentLocale];
//        
//        if (comparisonResult == NSOrderedSame) {
//            orderedSameCount++;
//        }
//        return comparisonResult;
//    }];
//    
//    NSLog(@"diacriticInsensitiveSortArray: %@", diacriticInsensitiveSortArray);
//    NSLog(@"orderedSameCount: %zd", orderedSameCount);
//    
//    size_t count = 10;
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_apply(count, queue, ^(size_t i) {
//        printf("%zu\n", i);
//    });
//
//    
//    void (^blockArray[3])(void);  // an array of 3 block references
//    
//    for (int i = 0; i < 3; ++i) {
//        blockArray[i] = ^{ printf("hello, %d\n", i); };
//        // WRONG: The block literal scope is the "for" loop.
//    }
//    blockArray[0]();
//    blockArray[1]();
//    blockArray[2]();
    
//    binBlock _block;
//    _Block_copy(&_block);
    
    // 카테고리도 컴파일 단계에서 추가되는것같음
//    Human *human1 = [[Human alloc] initWithName:@"데이빗" age:50];
//    if ([human1 respondsToSelector:@selector(speak)]) {
//        NSLog(@"speak 가능");
//        [human1 performSelector:@selector(speak)];
//    }

    //
//    NSString *string1 = @"before1";
//    NSLog(@"string1 = %@, %p", string1, string1);
//    [self printThisString:string1];
//    NSLog(@"string1 = %@, %p", string1, string1);
//    NSString *string2 = @"before2";
//    NSLog(@"string2 = %@, %p", string2, string2);
//    [self printThisStringAndFix:&string2];
//    NSLog(@"string2 = %@, %p", string2, string2);
//    
//    NSError *error;
//    [self makeError:&error];
//    NSLog(@"after makeError = %@", error);
//    NSError *error2;
//    NSLog(@"error2 = %@", error2);
//    NSLog(@"error2's address = %p", &error2);
//    
//    [self makeError:nil];
//
    
//    NSArray *array1 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
//    @try {
//        id object = [array1 objectAtIndex:10];
//    } @catch (NSException *exception) {
//        NSLog(@"exception = %@", exception);
//    } @finally {
//        NSLog(@"always");
//    }
    
    
    // Collecion의 Block Enumeration
//    NSArray *array1 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
//    NSArray *array2 = [array1 copy];
//    for (int i = 0; i < array1.count; i++) {
//        NSString *s1 = array1[i];
//        NSString *s2 = array2[i];
//        NSLog(@"1:<%p>,2:<%p>, %@", s1, s2, s1);
//    }
//    [array1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"Object at index %lu is %@", idx, obj);
//        if ([obj isEqual:@"3"]) {
//            *stop = YES;
//        }
//    }];
//    NSMutableArray *testArray = [NSMutableArray array];
//    for (int i = 0; i < 10000; i++) {
//        [testArray addObject:[NSString stringWithFormat:@"%zd", i]];
//    }
//    __block NSTimeInterval stamp;
    // stamp = 0.000358
//    [testArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (idx == 0) {
//            stamp = [[NSDate date] timeIntervalSince1970];
//        }else if (idx == 9999) {
//            stamp = ([[NSDate date] timeIntervalSince1970] - stamp);
//            NSLog(@"stamp = %f", stamp);
//        }
//    }];
//     stamp = 0.000294
//    [testArray enumerateObjectsWithOptions:NSEnumerationConcurrent
//                                usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                                    if (idx == 0) {
//                                        stamp = [[NSDate date] timeIntervalSince1970];
//                                    }else if (idx == 9999) {
//                                        stamp = ([[NSDate date] timeIntervalSince1970] - stamp);
//                                        NSLog(@"stamp = %f", stamp);
//                                    }
//                                }];
    
    // Collection Enumeration 테스트
//    NSSet *set = [NSSet setWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",nil];
//    
//    for (NSString *s in set) {
//        NSLog(@"s = %@", s);
//    }
//    NSEnumerator *enumerator = [set objectEnumerator];
//    id value;
//    while (value = [enumerator nextObject]) {
//        NSLog(@"value = %@", value);
//    }
    
    // 벨류와 콜렉션!
//    MyIntegerFloatStruct aStruct;
//    aStruct.i = 42;
//    aStruct.f = 3.14;
//    
//    NSValue *structValue = [NSValue value:&aStruct
//                             withObjCType:@encode(MyIntegerFloatStruct)];
//    MyIntegerFloatStruct bStruct;
//    [structValue getValue:&bStruct];
//    NSLog(@"bStruct.i = %zd, bStruct.f = %f", bStruct.i, bStruct.f);
//    
//    
//    NSLog(@"structValue = %@", structValue);
//    
//    NSString *stringArray[4] = {@"a",@"b",@"c",@"d"};
//    NSLog(@"stringArray = %@", stringArray[1]);
//    
//    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
//                                @"NotNil", @"anObject",
//                                @"Hello, World!", @"helloString",
//                                @42, @"magicNumber",
//                                @"NotNil", @"aValue", nil];
////                                @"isNil?", nil];
//    NSLog(@"dictionary = %@", dictionary);
    
//    NSArray *array = @[@"asfd", @"asdf", nil, @"asdf"];
    
//    NSInteger a = 0;
//    size_t size = sizeof(a);
//    printf("size = %lu", size);
    
    
    // 뭐였지 이건.. 암튼 테스트인데
//    Human *human1 = [[Human alloc] initWithName:@"데이빗" age:50];
//    Human *human2 = [human1 copy];
//    NSLog(@"human1 = %@", human1);
//    NSLog(@"human2 = %@", human2);
//    [human1 setCountry:@"us"];
//    for (int i = 0; i < 1000; i++) {
//        [human1 speak];
//    }
    
    
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
    
    /// 로컬변수의 nil 자동 초기화
//    id object;
//    NSLog(@"object = %@", object);
//    [object removeAllObjects];
//    NSLog(@"object = %@", object);
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
    NSLog(@"button selected");
//    NSLog(@"ivar_string = %@", ivar_string);
//    self.delegate.helloString = @"hello?";
//    [self printHelloString];
    
    if ([self.delegate respondsToSelector:@selector(printHelloString)]) {
        
    }
//    NSLog(@"self.propertyBlock = %@ <%p>",
//          self.propertyBlock, self.propertyBlock);
//    NSLog(@"self.propertyBlock2 = %@ <%p>",
//          self.propertyBlock2, self.propertyBlock2);
}

- (void)printHelloString {
    NSLog(@"%@", self.delegate.helloString);
}

//- (BOOL)respondsToSelector:(SEL)aSelector {
//    return YES;
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"methodSignatureForSelector = %@", NSStringFromSelector(aSelector));
    
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        signature = [self.otherObject methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ( [super respondsToSelector:aSelector] )
        return YES;
    else {
        /* Here, test whether the aSelector message can     *
         * be forwarded to another object and whether that  *
         * object can respond to it. Return YES if it can.  */
        return [self.otherObject respondsToSelector:aSelector];
    }
    return NO;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation = %@", anInvocation);
    
    if ([self.otherObject respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:self.otherObject];
    }else {
        [super forwardInvocation:anInvocation];
    }
}

//- (void)printThisString:(NSString *)__string {
//    NSLog(@"%@, %p", __string, __string);
////    __string = @"after1";
////    NSLog(@"%@, %p", __string, __string);
//    
//    if ([self.otherObject respondsToSelector:@selector(printThisString:)]) {
//        [self.otherObject performSelector:@selector(printThisString:) withObject:__string];
//    }
//}

- (void)printThisStringAndFix:(NSString **)__string {
    NSLog(@"what is it? = %p", __string);
    NSLog(@"%@, %p", *__string, *__string);
    *__string = @"after2";
}

- (void)emptyMethod {
    NSLog(@"emptyMethod");
}
- (void)iteratorMethod {
    for (int i = 1; i <= 100; i++) {
        NSLog(@"i = %zd", i);
    }
}

- (BOOL)doSomethingThatMayGenerateAnError:(NSError **)error {
    NSLog(@"error's address = %p", error);
    
    if (error) {
        NSLog(@"setting");
        *error = [NSError errorWithDomain:@"com.MyCompany.MyApplication.ErrorDomain"
                                       code:400
                                   userInfo:@{NSLocalizedDescriptionKey:@"help!!"}];
    } else {
        NSLog(@"fail");
        // 크래쉬
//        *error = [NSError errorWithDomain:@"com.MyCompany.MyApplication.ErrorDomain"
//                                     code:400
//                                 userInfo:@{NSLocalizedDescriptionKey:@"help!!"}];
    }
    return NO;
}

- (void (^)(void))newBlock {
    return ^{
        
    };
}

- (void)checkBlock:(BinBlock)block {
    block();
    NSLog(@"block = %@ <%p>", block, block);
    
//    int k = 10;
//    __block int array[k];
    
}


- (void)message {
    // implementation
    self;
    _cmd;
}

@end
