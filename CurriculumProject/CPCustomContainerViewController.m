//
//  CPCustomContainerViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 29..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPCustomContainerViewController.h"

#import "CPCustomContent_3_ViewController.h"
#import "CPCustomContent_4_ViewController.h"

@interface CPCustomPresentationController : UIPresentationController
@property UIView *dimmingView;
@end

@implementation CPCustomPresentationController
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
                    presentingViewController:(UIViewController *)presentingViewController {
    self = [super initWithPresentedViewController:presentedViewController
                         presentingViewController:presentingViewController];
    if(self) {
        NSLog(@"CPCustomPresentationController initWithPresentedViewController");
        // Create the dimming view and set its initial appearance.
        self.dimmingView = [[UIView alloc] init];
        [self.dimmingView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.4]];
        [self.dimmingView setAlpha:0.0];
    }
    return self;
}

- (CGRect)frameOfPresentedViewInContainerView {
    NSLog(@"frameOfPresentedViewInContainerView");
    
    CGRect presentedViewFrame = CGRectZero;
    CGRect containerBounds = [[self containerView] bounds];
    
    presentedViewFrame.size = CGSizeMake(containerBounds.size.width,
                                         floor(containerBounds.size.height/2.f));
    presentedViewFrame.origin.y = presentedViewFrame.size.height;
    return presentedViewFrame;
}

- (void)presentationTransitionWillBegin {
    NSLog(@"presentationTransitionWillBegin");
    // Get critical information about the presentation.
    UIView* containerView = [self containerView];
    UIViewController* presentedViewController = [self presentedViewController];
    
    // Set the dimming view to the size of the container's
    // bounds, and make it transparent initially.
    [[self dimmingView] setFrame:[containerView bounds]];
    [[self dimmingView] setAlpha:0.0];
    
    // Insert the dimming view below everything else.
    [containerView insertSubview:[self dimmingView] atIndex:0];
    
    // Set up the animations for fading in the dimming view.
    if([presentedViewController transitionCoordinator]) {
        [[presentedViewController transitionCoordinator]
         animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>
                                      context) {
             // Fade in the dimming view.
             [[self dimmingView] setAlpha:1.0];
         } completion:nil];
    }
    else {
        [[self dimmingView] setAlpha:1.0];
    }
}
 
- (void)presentationTransitionDidEnd:(BOOL)completed {
    NSLog(@"presentationTransitionDidEnd %zd", completed);
   // Remove the dimming view if the presentation was aborted.
   if (!completed) {
      [_dimmingView removeFromSuperview];
   }
}

- (void)dismissalTransitionWillBegin {
    NSLog(@"dismissalTransitionWillBegin");
    // Fade the dimming view back out.
    if([[self presentedViewController] transitionCoordinator]) {
        [[[self presentedViewController] transitionCoordinator]
         animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>
                                      context) {
             [[self dimmingView] setAlpha:0.0];
         } completion:nil];
    }
    else {
        [[self dimmingView] setAlpha:0.0];
    }
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    NSLog(@"dismissalTransitionDidEnd %zd", completed);
    // If the dismissal was successful, remove the dimming view.
    if (completed)
        [self.dimmingView removeFromSuperview];
}


@end


@interface CPCustomPresentationObject : NSObject <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
@property BOOL isDismissing;
@end

@implementation CPCustomPresentationObject
#pragma mark - UIViewControllerAnimatedTransitioning
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"animateTransition = %@", transitionContext);
    
    NSTimeInterval interval = [self transitionDuration:transitionContext];
    
    [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    //    containerView.backgroundColor = [UIColor redColor];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSLog(@"VC from = %@, to = %@",
          fromVC, toVC);
    CGRect toVC_I_Frame = [transitionContext initialFrameForViewController:toVC];
    CGRect fromVC_I_Frame = [transitionContext initialFrameForViewController:fromVC];
    
    CGRect toVC_F_Frame = [transitionContext finalFrameForViewController:toVC];
    CGRect fromVC_F_Frame = [transitionContext finalFrameForViewController:fromVC];
    
    NSLog(@"Frame \nInitial from = %@, to = %@\nFinal from %@, to %@",
          NSStringFromCGRect(fromVC_I_Frame), NSStringFromCGRect(toVC_I_Frame),
          NSStringFromCGRect(fromVC_F_Frame), NSStringFromCGRect(toVC_F_Frame));
    
    CGRect boundsOfContainer = containerView.bounds;
    NSLog(@"boundsOfContainer = %@", NSStringFromCGRect(boundsOfContainer));
    
    if (!self.isDismissing) {
        [containerView insertSubview:toVC.view belowSubview:fromVC.view];
        
        [toVC.view setFrame:CGRectMake(toVC_F_Frame.origin.x,
                                       CGRectGetMaxY(boundsOfContainer),
                                       CGRectGetWidth(toVC_F_Frame),
                                       CGRectGetHeight(toVC_F_Frame))];
        
        [UIView animateWithDuration:interval animations:^{
            [toVC.view setFrame:toVC_F_Frame];
        } completion:^(BOOL finished) {
            BOOL success = ![transitionContext transitionWasCancelled];
            NSLog(@"success = %@", success?@"YES":@"NO");
            if (success) {
                
            }else {
                
            }
            
            [transitionContext completeTransition:success];
        }];
    } else {
        [UIView animateWithDuration:interval animations:^{
            [fromVC.view setFrame:CGRectMake(fromVC_F_Frame.origin.x,
                                             CGRectGetMaxY(boundsOfContainer),
                                             CGRectGetWidth(fromVC_F_Frame),
                                             CGRectGetHeight(fromVC_F_Frame))];
        } completion:^(BOOL finished) {
            BOOL success = ![transitionContext transitionWasCancelled];
            NSLog(@"success = %@", success?@"YES":@"NO");
            if (success) {
                [fromVC.view removeFromSuperview];
            }else {
                
            }
            
            [transitionContext completeTransition:success];
        }];
    }
}

- (void)animationEnded:(BOOL)transitionCompleted {
    NSLog(@"animationEnded = %@", transitionCompleted?@"YES":@"NO");
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"transitionDuration = %@", transitionContext);
    return 0.4;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    NSLog(@"animationControllerForPresentedController");
    self.isDismissing = NO;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    NSLog(@"animationControllerForDismissedController");
    self.isDismissing = YES;
    return self;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    NSLog(@"presentationControllerForPresentedViewController");
    CPCustomPresentationController *presentationController = [[CPCustomPresentationController alloc] initWithPresentedViewController:presented
                                                                                                            presentingViewController:presenting];
    
    return presentationController;
}
@end


@interface CPCustomContainerViewController ()

@property CPCustomPresentationObject *presentationObject;

@end

@implementation CPCustomContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view.
    
//    self.modalPresentationStyle = UIModalPresentationCustom;
//    self.transitioningDelegate = self;
    self.presentationObject = [CPCustomPresentationObject new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button_1_Handler:(UIButton *)sender {
    CPCustomContent_3_ViewController *controller =
    [self.storyboard instantiateViewControllerWithIdentifier:@"CPCustomContent_3_ViewController"];
    controller.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    [self presentViewController:controller
                       animated:YES
                     completion:nil];
}

- (IBAction)button_2_Handler:(UIButton *)sender {
    CPCustomContent_4_ViewController *controller =
    [self.storyboard instantiateViewControllerWithIdentifier:@"CPCustomContent_4_ViewController"];
    controller.transitioningDelegate = self.presentationObject;
    controller.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:controller
                       animated:YES
                     completion:nil];
}

@end
