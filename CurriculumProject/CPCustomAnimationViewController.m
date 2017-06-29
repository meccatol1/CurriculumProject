//
//  CPCustomAnimationViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 28..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPCustomAnimationViewController.h"

@interface CPPresentationController : UIPresentationController <UIAdaptivePresentationControllerDelegate>

@end

@implementation CPPresentationController
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    NSLog(@"adaptivePresentationStyleForPresentationController");
    return UIModalPresentationNone;
}

- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style {
    NSLog(@"presentationController viewControllerForAdaptivePresentationStyle");
    return controller.presentingViewController;
}

@end

@interface CPAnimationClass : UIPercentDrivenInteractiveTransition <UIViewControllerAnimatedTransitioning>

@property BOOL isDismissing;

@property id<UIViewControllerContextTransitioning> contextData;
@property UIPanGestureRecognizer *panGesture;

@end

@implementation CPAnimationClass // Animator Object, 혼자 대부분의 일을 처리

- (void)setDismissInteractive:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.contextData = transitionContext;
    
    // Create a pan gesture recognizer to monitor events.
    self.panGesture = [[UIPanGestureRecognizer alloc]
                       initWithTarget:self action:@selector(handleSwipeUpdate:)];
    self.panGesture.maximumNumberOfTouches = 1;
    
    // Add the gesture recognizer to the container view.
    UIView *container = [self.contextData containerView];
    [container addGestureRecognizer:self.panGesture];
}

#pragma mark - UIPercentDrivenInteractiveTransition
- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"startInteractiveTransition %@", transitionContext);
    // Always call super first.
    [super startInteractiveTransition:transitionContext];
    
    // Save the transition context for future reference.
//    self.contextData = transitionContext;
//    
//    // Create a pan gesture recognizer to monitor events.
//    self.panGesture = [[UIPanGestureRecognizer alloc]
//                       initWithTarget:self action:@selector(handleSwipeUpdate:)];
//    self.panGesture.maximumNumberOfTouches = 1;
//    
//    // Add the gesture recognizer to the container view.
//    UIView *container = [self.contextData containerView];
//    [container addGestureRecognizer:self.panGesture];
}

- (void)handleSwipeUpdate:(UIPanGestureRecognizer *)recognizer
{
//    NSLog(@"screenEdgeDidPan = %@", recognizer);
//    NSLog(@"fromVC = %@, toVC = %@",
//          [self.contextData viewControllerForKey:UITransitionContextFromViewControllerKey],
//          [self.contextData viewControllerForKey:UITransitionContextToViewControllerKey]);
    
    UIView *container = [self.contextData containerView];
    static CGPoint initialLoc;
    
    CGPoint velocity = [recognizer velocityInView:container];
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan :
            initialLoc = [recognizer locationInView:container];
            
            [[self.contextData viewControllerForKey:UITransitionContextToViewControllerKey]
             dismissViewControllerAnimated:YES completion:^{
                 NSLog(@"dismiss completion");
             }];
            break;
        case UIGestureRecognizerStateChanged :
        {
            CGPoint newPoint = [recognizer locationInView:container];
            CGFloat ratio = (initialLoc.y-newPoint.y) / CGRectGetHeight(recognizer.view.bounds);
            [self updateInteractiveTransition:ratio];
        }
            break;
            
        case UIGestureRecognizerStateEnded :
            NSLog(@"UIGestureRecognizerStateEnded");
            if (velocity.y > 0) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
                self.contextData = nil;
            }
            break;
            
        case UIGestureRecognizerStateCancelled :
            NSLog(@"UIGestureRecognizerStateCancelled");
            [self cancelInteractiveTransition];
            break;
            
        default:
            break;
    }
}

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
    NSLog(@"Frame from = %@, to = %@",
          NSStringFromCGRect([transitionContext finalFrameForViewController:fromVC]),
          NSStringFromCGRect([transitionContext finalFrameForViewController:toVC]));
    
    CGRect boundsOfContainer = containerView.bounds;
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    if (!self.isDismissing) {
        NSLog(@"containerView = %@", containerView);
        [self setDismissInteractive:transitionContext];
        
        [toVC.view setFrame:boundsOfContainer];
        toVC.view.alpha = 0.f;
        toVC.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
        [UIView animateWithDuration:interval/2.0
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             [fromVC.view setAlpha:0.0];
                             [fromVC.view setTransform:CGAffineTransformMakeScale(0.01, 0.01)];
                         } completion:^(BOOL finished) {
                             fromVC.view.transform = CGAffineTransformIdentity;
                             
                             [UIView animateWithDuration:interval/2.0
                                                   delay:0
                                                 options:UIViewAnimationOptionCurveEaseIn
                                              animations:^{
                                                  toVC.view.alpha = 1.f;
                                                  toVC.view.transform = CGAffineTransformIdentity;
                                              } completion:^(BOOL finished) {
                                                  // [transitionContext transitionWasCancelled] 실패에 대비해야 한다고. 흠.
                                                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                                              }];
                         }];
    } else {
        [toVC.view setFrame:CGRectMake(0, CGRectGetMaxY(boundsOfContainer),
                                       CGRectGetWidth(boundsOfContainer),
                                       CGRectGetHeight(boundsOfContainer))];
        toVC.view.alpha = 1.0f;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [toVC.view setFrame:boundsOfContainer];
            
            [fromVC.view setFrame:CGRectMake(0, -CGRectGetMaxY(boundsOfContainer),
                                             CGRectGetWidth(boundsOfContainer),
                                             CGRectGetHeight(boundsOfContainer))];
        } completion:^(BOOL finished) {
            BOOL success = ![transitionContext transitionWasCancelled];
            NSLog(@"success = %@", success?@"YES":@"NO");
            if (success) {
                [fromVC.view removeFromSuperview];
            }else {
//                [fromVC.view setFrame:boundsOfContainer];
                
            }
            
            [transitionContext completeTransition:success];
        }];
    }
    
//    if (!self.isDismissing) {
//        NSLog(@"containerView = %@", containerView);
//        [containerView insertSubview:toVC.view belowSubview:fromVC.view];
//        
//        [toVC.view setFrame:CGRectMake(0, -CGRectGetMaxY(boundsOfContainer),
//                                       CGRectGetWidth(boundsOfContainer),
//                                       CGRectGetHeight(boundsOfContainer))];
//        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//            [fromVC.view setAlpha:0.0f];
//            [toVC.view setFrame:boundsOfContainer];
//        } completion:^(BOOL finished) {
//            [fromVC.view removeFromSuperview];
//            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        }];
//    } else {
//        [containerView insertSubview:toVC.view belowSubview:fromVC.view];
//        [toVC.view setFrame:boundsOfContainer];
//        toVC.view.alpha = 0.0f;
//        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//            toVC.view.alpha = 1.0f;
//            
//            [fromVC.view setFrame:CGRectMake(0, -CGRectGetMaxY(boundsOfContainer),
//                                             CGRectGetWidth(boundsOfContainer),
//                                             CGRectGetHeight(boundsOfContainer))];
//        } completion:^(BOOL finished) {
//            [fromVC.view removeFromSuperview];
//            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        }];
//    }
}

- (void)animationEnded:(BOOL)transitionCompleted {
    NSLog(@"animationEnded = %@", transitionCompleted?@"YES":@"NO");
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"transitionDuration = %@", transitionContext);
    return 0.63;
}

@end

@interface CPCustomAnimationViewController ()
@property CPAnimationClass *animator;
@property CPPresentationController *presentationController;
@end

@implementation CPCustomAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view.
    self.animator = [[CPAnimationClass alloc] init];
    self.transitioningDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    NSLog(@"animationControllerForPresentedController");
    self.animator.isDismissing = NO;
    self.interactive = YES;
    return self.animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    NSLog(@"animationControllerForDismissedController");
    self.animator.isDismissing = YES;
    return self.animator;
}


- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    NSLog(@"interactionControllerForDismissal = %@", animator);
    return self.interactive?self.animator:nil;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    NSLog(@"presentationControllerForPresentedViewController");
    CPPresentationController *presentationController = [[CPPresentationController alloc] initWithPresentedViewController:presented
                                                                                                presentingViewController:presenting];
    
    return presentationController;
}


@end
