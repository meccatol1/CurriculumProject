//
//  SubViewController.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 16..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "SubViewController.h"

#import "AFNetworking.h"


@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)test {
    NSDictionary *param = @{@"key1":@"value1",
                            @"key2":@"value2"};
    NSString *strImagePath = @"large_image_Path";
    
    NSMutableURLRequest *request1 =
    [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST"
                                                               URLString:@"URLString"
                                                              parameters:param
                                               constructingBodyWithBlock:^(id formData) {
                                                   [formData appendPartWithFileURL:[NSURL fileURLWithPath:strImagePath]
                                                                              name:@"sendimage"
                                                                          fileName:[strImagePath lastPathComponent]
                                                                          mimeType:@"image/png"
                                                                             error:nil];
                                               }
                                                                   error:nil];
    
    
    //    [[AFHTTPRequestSerializer serializer] requestW]
    [[AFHTTPRequestSerializer serializer] requestWithMultipartFormRequest:request1
                                              writingStreamContentsToFile:[NSURL fileURLWithPath:[strImagePath stringByDeletingPathExtension]]
                                                        completionHandler:^(NSError *error) {
                                                            
                                                        }];
    
    NSURLSessionConfiguration *configuration = [[NSURLSessionConfiguration alloc] init];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSProgress *progress = nil;
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request1
                                                               fromFile:[NSURL fileURLWithPath:strImagePath]
                                                               progress:^(NSProgress *progress) {
                                                                   
                                                               }
                                                      completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                                          NSLog(@"response : %@\n\n responseObject : %@\n\n error : %@", response, responseObject, error);
                                                      }];
    [uploadTask resume];
}

@end
