//
//  CPMainSessionViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 7. 3..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPMainSessionViewController.h"

// 이 클래스는 단순히 프로토콜 메서드 확인용
typedef void (^CompletionHandler)();

@interface MySessionDelegate : NSObject <NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate, NSURLSessionDownloadDelegate, NSURLSessionStreamDelegate>

@property NSMutableDictionary <NSString *, CompletionHandler>*completionHandlers;

@end

@implementation MySessionDelegate

- (void)URLSession:(NSURLSession *)session 
          dataTask:(NSURLSessionDataTask *)dataTask 
    didReceiveData:(NSData *)data {
    BLog();
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error == nil) {
        NSLog(@"Task: %@ completed successfully", task);
    } else {
        NSLog(@"Task: %@ completed with error: %@", task, [error localizedDescription]);
    }
//    double progress = (double)task.countOfBytesReceived / (double)task.countOfBytesExpectedToReceive;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.progressView.progress = progress;
//    });
//    self.downloadTask = nil;
}

//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
//{
//    BLog();
//    
//    if (error == nil)
//    {
//        NSLog(@"Task: %@ completed successfully", task);
//    }
//    else
//    {
//        NSLog(@"Task: %@ completed with error: %@", task, [error localizedDescription]);
//        
//    }
//    
////    double progress = (double)task.countOfBytesReceived / (double)task.countOfBytesExpectedToReceive;
////    dispatch_async(dispatch_get_main_queue(), ^{
////        self.progressView.progress = progress;
////    });
//    
////    self.downloadTask = nil;
//}

#pragma mark Download Task

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
//    if (downloadTask == self.downloadTask)
//    {
//        double progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
//        NSLog(@"DownloadTask: %@ progress: %lf", downloadTask, progress);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.progressView.progress = progress;
//        });
//    }
}

//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
//{
//    BLog();
//    
//    /*
//     Report progress on the task.
//     If you created more than one task, you might keep references to them and report on them individually.
//     */
//    
//    if (YES) // || downloadTask == self.downloadTask)
//    {
//        double progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
//        BLog(@"DownloadTask: %@ progress: %lf", downloadTask, progress);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.progressView.progress = progress;
//        });
//    }
//}


- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)downloadURL
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *URLs = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = [URLs objectAtIndex:0];
    
    NSURL *originalURL = [[downloadTask originalRequest] URL];
    NSURL *destinationURL = [documentsDirectory URLByAppendingPathComponent:[originalURL lastPathComponent]];
    
    NSError *errorCopy;
    BOOL success = [fileManager copyItemAtURL:downloadURL toURL:destinationURL error:&errorCopy];
    
    if (success) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIImage *image = [UIImage imageWithContentsOfFile:[destinationURL path]];
//            self.imageView.image = image;
//            self.imageView.hidden = NO;
//            self.progressView.hidden = YES;
//        });
    } else {
        NSLog(@"Error during the copy: %@", [errorCopy localizedDescription]);
    }
}

//- (void)URLSession:(NSURLSession *)session
//      downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)downloadURL
//{
//    BLog();
//    
//    /*
//     The download completed, you need to copy the file at targetPath before the end of this block.
//     As an example, copy the file to the Documents directory of your app.
//     */
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    NSArray *URLs = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
//    NSURL *documentsDirectory = [URLs objectAtIndex:0];
//    
//    NSURL *originalURL = [[downloadTask originalRequest] URL];
//    NSURL *destinationURL = [documentsDirectory URLByAppendingPathComponent:[originalURL lastPathComponent]];
//    NSError *errorCopy;
//    
//    // For the purposes of testing, remove any esisting file at the destination.
//    [fileManager removeItemAtURL:destinationURL error:NULL];
//    BOOL success = [fileManager copyItemAtURL:downloadURL toURL:destinationURL error:&errorCopy];
//    
//    if (success)
//    {
////        dispatch_async(dispatch_get_main_queue(), ^{
////            UIImage *image = [UIImage imageWithContentsOfFile:[destinationURL path]];
////            self.imageView.image = image;
////            self.imageView.hidden = NO;
////            self.progressView.hidden = YES;
////        });
//    }
//    else
//    {
//        /*
//         In the general case, what you might do in the event of failure depends on the error and the specifics of your application.
//         */
//        BLog(@"Error during the copy: %@", [errorCopy localizedDescription]);
//    }
//}


- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes
{
    NSLog(@"Session %@ download task %@ resumed at offset %lld bytes out of an expected %lld bytes.\n", session, downloadTask, fileOffset, expectedTotalBytes);
}

//- (void)URLSession:(NSURLSession *)session
//      downloadTask:(NSURLSessionDownloadTask *)downloadTask
//didFinishDownloadingToURL:(NSURL *)location
//{
//    NSLog(@"Session %@ download task %@ finished downloading to URL %@\n", session, downloadTask, location);
//
//    // Perform the completion handler for the current session
//    self.completionHandlers[session.configuration.identifier]();
//
//    // Open the downloaded file for reading
//    NSError *readError = nil;
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingFromURL:location error:readError];
//    // ...
//
//    // Move the file to a new URL
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSURL *cacheDirectory = [[fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] firstObject];
//    NSError *moveError = nil;
//    if ([fileManager moveItemAtURL:location toURL:cacheDirectory error:moveError]) {
//        // ...
//    }
//}


#pragma mark Upload Task
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
   didSendBodyData:(int64_t)bytesSent
    totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    // 얼마나 보냈는지 진행상태~ 업로드 3 종류에 상관없이 Progress 정보 얻을 수 있음
    
}

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
 needNewBodyStream:(void (^)(NSInputStream *bodyStream))completionHandler {
    
}


#pragma mark Authentication
- (void)URLSession:(NSURLSession *)session 
              task:(NSURLSessionTask *)task 
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge 
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler; {
    
}

#pragma mark Redirection
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
willPerformHTTPRedirection:(NSHTTPURLResponse *)response // status code
        newRequest:(NSURLRequest *)request
 completionHandler:(void (^)(NSURLRequest *))completionHandler {
//    [task cancel];
}

@end

@interface CPMainSessionViewController () <NSURLSessionDownloadDelegate, NSURLSessionDataDelegate>
@property (strong) NSURLSessionConfiguration *defaultConfiguration;
@property (strong) NSURLSession *defaultSession;
@property (strong) NSURLRequest *request;

@property BOOL isDownloading;
@property (strong) NSURLSessionDataTask *dataTask;
@property (strong) NSURLSessionDownloadTask *downloadTask;
@property (strong) NSData *resumeData;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CPMainSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSString *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *cachePath = [cachesDirectory stringByAppendingPathComponent:@"MyCache"];
    NSLog(@"cachesDirectory = %@", cachesDirectory);
    NSLog(@"cachePath = %@", cachePath);
    
//    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:16384 diskCapacity:268435456 diskPath:cachePath];
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10485760 diskCapacity:268435456 diskPath:cachePath];
    self.defaultConfiguration.URLCache = cache;
    self.defaultConfiguration.requestCachePolicy =
//    NSURLRequestUseProtocolCachePolicy;
    NSURLRequestReturnCacheDataElseLoad;
    
    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
    
    self.defaultSession = [NSURLSession sessionWithConfiguration:self.defaultConfiguration
                                                        delegate:self
                                                   delegateQueue:operationQueue];
    
    NSURL *url = [NSURL URLWithString: @"https://edmullen.net/test/rc.jpg"];
//    self.request = [NSURLRequest requestWithURL:url
//                                    cachePolicy:NSURLRequestReturnCacheDataElseLoad
//                                timeoutInterval:30];
    
//    self.request = [NSURLRequest requestWithURL:url
//                                    cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                timeoutInterval:30];
    
//    self.request = [NSURLRequest requestWithURL:url
//                                    cachePolicy:NSURLRequestReloadIgnoringCacheData
//                                timeoutInterval:30];
    
    self.request = [NSURLRequest requestWithURL:url];
//    self.request.cachePolicy
    
//    NSString *originalString = @"color-#708090";
//    NSCharacterSet *allowedCharacters = [NSCharacterSet URLFragmentAllowedCharacterSet];
//    NSString *percentEncodedString = [originalString stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
//    NSLog(@"%@", percentEncodedString);  // prints "color-%23708090"
//    NSString *decodedFragment = [percentEncodedString stringByRemovingPercentEncoding];
//    NSLog(@"%@", decodedFragment);
//    
//    NSURL *URL = [NSURL URLWithString:@"https://example.com/#color-%23708090"];
//    NSLog(@"url string = %@", URL.absoluteString);
//    NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:NO];
//    
//    NSString *fragment = components.fragment;
//    NSLog(@"%@", fragment); // prints "color-#708090"
    
//    [self urlSessionTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)urlSessionTest {
    NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSessionConfiguration *ephemeralConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSessionConfiguration *backgroundConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier: @"com.myapp.networking.background"];
    
    NSLog(@"defaultConfiguration %@, %@", defaultConfiguration, defaultConfiguration.identifier);
    NSLog(@"ephemeralConfiguration %@, %@", ephemeralConfiguration, ephemeralConfiguration.identifier);
    NSLog(@"backgroundConfiguration %@, %@", backgroundConfiguration, backgroundConfiguration.identifier);
    
    NSString *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *cachePath = [cachesDirectory stringByAppendingPathComponent:@"MyCache"];
    NSLog(@"cachesDirectory = %@", cachesDirectory);
    NSLog(@"cachePath = %@", cachePath);
    
    NSString *cachesDirectory2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSLocalDomainMask, YES).firstObject;
    NSLog(@"cachesDirectory2 = %@", cachesDirectory2);
    NSString *cachesDirectory3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSNetworkDomainMask, YES).firstObject;
    NSLog(@"cachesDirectory3 = %@", cachesDirectory3);
    NSString *cachesDirectory4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSAllDomainsMask, YES).firstObject;
    NSLog(@"cachesDirectory4 = %@", cachesDirectory4);
    
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:16384 diskCapacity:268435456 diskPath:cachePath];
    defaultConfiguration.URLCache = cache;
    defaultConfiguration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    
    return;
    
    id <NSURLSessionDelegate> delegate = [[MySessionDelegate alloc] init];
    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];

    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfiguration
                                                                 delegate:delegate
                                                            delegateQueue:operationQueue];
    NSURLSession *ephemeralSession = [NSURLSession sessionWithConfiguration:ephemeralConfiguration
                                                                   delegate:delegate
                                                              delegateQueue:operationQueue];
    NSURLSession *backgroundSession = [NSURLSession sessionWithConfiguration:backgroundConfiguration
                                                                    delegate:delegate
                                                               delegateQueue:operationQueue];
    
    ephemeralConfiguration.allowsCellularAccess = NO;
    NSURLSession *ephemeralSessionWiFiOnly = [NSURLSession sessionWithConfiguration:ephemeralConfiguration delegate:delegate delegateQueue:operationQueue];
    
    //// download
    NSURL *url = [NSURL URLWithString: @"https://www.example.com/"];
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL:url];
    [dataTask resume];
    
    [defaultSession downloadTaskWithResumeData:nil];
    
    NSURL *url2 = [NSURL URLWithString:@"https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/ObjC_classic/FoundationObjC.pdf"];
    NSURLSessionDownloadTask *downloadTask = [backgroundSession downloadTaskWithURL:url2];
    [downloadTask resume];
    
//    __block NSData *dataToResume = nil;
//    [downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
//        dataToResume = resumeData;
//    }];
//    
//    NSURLSessionDownloadTask *downloadTask2 = [defaultSession downloadTaskWithResumeData:dataToResume];
    
    //// upload Body Content
    {
        NSURL *textFileURL = [NSURL fileURLWithPath:@"/path/to/file.txt"];
        NSData *data = [NSData dataWithContentsOfURL:textFileURL];
        
        NSURL *url = [NSURL URLWithString:@"https://www.example.com/"];
        NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
        mutableRequest.HTTPMethod = @"POST";
        [mutableRequest setValue:[NSString stringWithFormat:@"%lld", data.length] forHTTPHeaderField:@"Content-Length"];
        [mutableRequest setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
        
        NSURLSessionUploadTask *uploadTask = [defaultSession uploadTaskWithRequest:mutableRequest fromData:data];
        [uploadTask resume];
    }
    //// upload file
    {
        NSURL *textFileURL = [NSURL fileURLWithPath:@"/path/to/file.txt"];
        
        NSURL *url = [NSURL URLWithString:@"https://www.example.com/"];
        NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
        mutableRequest.HTTPMethod = @"POST";
        
        NSURLSessionUploadTask *uploadTask = [defaultSession uploadTaskWithRequest:mutableRequest fromFile:textFileURL];
        [uploadTask resume];
    }
    
    //// uploadWithStream
    {
        NSURL *textFileURL = [NSURL fileURLWithPath:@"/path/to/file.txt"];
        NSData *dataWithFile = [NSData dataWithContentsOfFile:textFileURL.absoluteString];
        
        NSURL *uploadUrl = [NSURL URLWithString:@"https://www.example.com/"];
        NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:uploadUrl];
        mutableRequest.HTTPMethod = @"POST";
        mutableRequest.HTTPBodyStream = [NSInputStream inputStreamWithFileAtPath:textFileURL.path];
        [mutableRequest setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
        [mutableRequest setValue:[NSString stringWithFormat:@"%lu", dataWithFile.length] forHTTPHeaderField:@"Content-Length"];
        
        NSURLSessionUploadTask *uploadTask = [defaultSession uploadTaskWithStreamedRequest:mutableRequest];
        [uploadTask resume];
    }
    
    {
//        NSString *url = [@"asdf/asdf" stringByAddingPercentEscapesUsingEncoding:<#(NSStringEncoding)#>]
        
        NSURL *URL = [NSURL URLWithString:@"https://example.com/#color-%23708090"];
        NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:NO];
        
        NSString *fragment = components.fragment;
        NSLog(@"%@", fragment); // prints "color-#708090"
    }
}

- (void)uploadWithStream {
    
}

- (IBAction)startButtonHandler:(UIButton *)sender {
    if (self.isDownloading == NO) {
        self.isDownloading = YES;
        
        NSLog(@"current cache currentMemoryUsage = %lu", self.defaultConfiguration.URLCache.currentMemoryUsage);
        NSLog(@"current cache currentDiskUsage = %lu", self.defaultConfiguration.URLCache.currentDiskUsage);
        
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        
//        id <NSURLSessionDelegate> delegate = [[MySessionDelegate alloc] init];
        
        if (self.resumeData) {
            NSLog(@"start with resumeData = %@", _resumeData);
            self.downloadTask = [self.defaultSession downloadTaskWithResumeData:self.resumeData];
            [self.downloadTask resume];
        }else {
//            NSURL *url = [NSURL URLWithString: @"http://127.0.0.1:8080/kitten3.PNG"];
            
            self.dataTask = [self.defaultSession dataTaskWithRequest:self.request];
            [self.dataTask resume];
            
//            self.downloadTask = [self.defaultSession downloadTaskWithRequest:self.request];
//            [self.downloadTask resume];
        }
    }else {
//        [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
//            NSLog(@"cancel!! = %@", resumeData);
//            self.resumeData = resumeData;
//        }];
//        
//        [sender setTitle:@"Start" forState:UIControlStateNormal];
//        self.isDownloading = NO;
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - URLSessionDelegate Methods

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error == nil) {
        NSLog(@"Task: %@ completed successfully", task);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressView.progress = 0;
            
            self.resumeData = nil;
            self.isDownloading = NO;
            [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
        });
    } else {
        NSLog(@"Task: %@ completed with error: %@", task, [error localizedDescription]);
    }
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    double progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    NSLog(@"DownloadTask: %@ progress: %lf", downloadTask, progress);
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.progressView.progress = progress;
//    });
    self.progressView.progress = progress;
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)downloadURL
{
    NSLog(@"didFinishDownloadingToURL downloadTask = %@", downloadTask);
    NSLog(@"downloadURL = %@", downloadURL);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *URLs = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = [URLs objectAtIndex:0];
    
    NSString *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *cachePath = [cachesDirectory stringByAppendingPathComponent:@"MyCache"];
    
    NSURL *originalURL = downloadURL;
    NSLog(@"originalURL = %@", originalURL);
    NSURL *destinationURL = [documentsDirectory URLByAppendingPathComponent:[originalURL lastPathComponent]];
//    NSURL *destinationURL = [NSURL fileURLWithPath:[cachePath stringByAppendingPathComponent:[originalURL lastPathComponent]]];
    NSLog(@"destinationURL = %@", destinationURL);
    
//    [fileManager removeItemAtURL:destinationURL error:NULL];
    
    NSError *errorCopy;
    BOOL success = [fileManager copyItemAtURL:downloadURL toURL:destinationURL error:&errorCopy];
    
    if (success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithContentsOfFile:[destinationURL path]];
            self.imageView.image = image;
            self.imageView.hidden = NO;
        });
    } else {
        NSLog(@"Error during the copy: %@", [errorCopy localizedDescription]);
    }
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes
{
    NSLog(@"Session %@ download task %@ resumed at offset %lld bytes out of an expected %lld bytes.\n", session, downloadTask, fileOffset, expectedTotalBytes);
    double progress = (double)fileOffset / (double)expectedTotalBytes;
    NSLog(@"DownloadTask: %@ progress: %lf", downloadTask, progress);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = progress;
    });
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    NSLog(@"didBecomeDownloadTask data length = %@", dataTask);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"dataTask didReceiveData = %lu", data.length);
}

//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
// willCacheResponse:(NSCachedURLResponse *)proposedResponse
// completionHandler:(void (^)(NSCachedURLResponse * __nullable cachedResponse))completionHandler {
//    NSLog(@"willCacheResponse = %@", proposedResponse);
//    NSLog(@"cache data length = %lu", proposedResponse.data.length);
//    NSLog(@"storagePolicy = %zd", proposedResponse.storagePolicy);
//    
//    completionHandler(proposedResponse);
//}

@end
