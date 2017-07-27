//
//  CPScrollContainerViewController.m
//  CurriculumProject
//
//  Created by Hyungsung_Kim on 2017. 7. 21..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPScrollContainerViewController.h"

#import "CPTestClass.h"

@interface CPCustomLayout : UICollectionViewFlowLayout

@end

@implementation CPCustomLayout
- (void)prepareLayout {
    NSLog(@"prepareLayout");
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = self.collectionView.frame.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
}

@end

@interface CPScrollContainerViewController () <UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) CPCustomLayout *customLayout;

@property (assign, nonatomic) NSInteger currentIndex;
@property (assign, nonatomic) BOOL userDragging;

@end

@implementation CPScrollContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.customLayout = [CPCustomLayout new];
    self.collectionView.collectionViewLayout = self.customLayout;
    self.currentIndex = 0;
    
    [CPTestClass checker];
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

- (IBAction)buttonsHandler:(UIButton *)sender {
    NSInteger toIndex = sender.tag;
    [self animatingTo:toIndex];
    [self setCurrentIndex:toIndex];
    [self.collectionView setContentOffset:CGPointMake(CGRectGetWidth(self.scrollView.frame)*toIndex, 0) animated:YES];
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self setUserDragging:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.userDragging) {
        CGPoint offset = scrollView.contentOffset;
        
        NSLog(@"offset = %@", NSStringFromCGPoint(offset));
        
        CGFloat currentOriginX = CGRectGetWidth(self.collectionView.frame)*self.currentIndex;
        
        NSInteger toIndex;
        CGFloat progress;
        
        if (offset.x < currentOriginX) {
            toIndex = MAX(0, self.currentIndex-1);
            progress = (currentOriginX-offset.x)/CGRectGetWidth(self.collectionView.frame);
        } else {
            toIndex = MIN([self collectionView:self.collectionView numberOfItemsInSection:0]-1, self.currentIndex+1);
            progress = (offset.x-currentOriginX)/CGRectGetWidth(self.collectionView.frame);
        }
        
        [self scrollView:scrollView indexFrom:self.currentIndex indexTo:toIndex progress:progress];
    }
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGPoint targetPoint = *targetContentOffset;
    NSLog(@"scrollViewWillEndDragging, targetContentOffset = %@", NSStringFromCGPoint(targetPoint));
    [self setUserDragging:NO];
    NSInteger toIndex = (NSInteger)(targetPoint.x/CGRectGetWidth(self.collectionView.frame));
    [self animatingTo:toIndex];
    [self setCurrentIndex:toIndex];
}

- (void)animatingTo:(NSInteger)to {
    NSArray *colours = @[[UIColor redColor], [UIColor yellowColor], [UIColor purpleColor]];
    NSMutableArray *aniColurs = [NSMutableArray array];
    if (self.currentIndex == to || abs((int)(self.currentIndex-to)) == 1) {
        [aniColurs addObject:colours[to]];
    } else if (self.currentIndex < to) {
        for (int i = (int)self.currentIndex; i <= to; i++) {
            [aniColurs addObject:colours[i]];
        }
    } else {
        for (int i = (int)self.currentIndex; i >= to; i--) {
            [aniColurs addObject:colours[i]];
        }
    }
    NSEnumerator *enumerator = [aniColurs objectEnumerator];
    
    [UIView animateWithDuration:0.35 animations:^{
        UIColor *color = nil;
        while (color = [enumerator nextObject]) {
            [self.headerView setBackgroundColor:color];
        }
    }];
}

- (void)scrollView:(UIScrollView *)scrollView indexFrom:(NSInteger)from indexTo:(NSInteger)to progress:(CGFloat)progress
{
    NSLog(@"from[%zd] -> to[%zd], progress = %f", from, to, progress);
    
    // get your colours to fade between
    NSArray *colours = @[[UIColor redColor], [UIColor yellowColor], [UIColor purpleColor]];
    
    // choose the colours to fade between based on the percentage.
//    if (percentageOffset.x < 0.5) {
//        // multiply the offset by 2 because we want 0.5 to be 100%
//        _headerView.backgroundColor = [self fadeFromColor:colours[0] toColor:colours[1] withPercentage:percentageOffset.x*2];
//    } else {
//        // minus 0.5 because we want 0.5 to be 0%
//        _headerView.backgroundColor = [self fadeFromColor:colours[1] toColor:colours[2] withPercentage:(percentageOffset.x-0.5)*2];
//    }
    [UIView animateWithDuration:0.01
                     animations:^{
                         [self.headerView setBackgroundColor:[self fadeFromColor:colours[from] toColor:colours[to] withPercentage:progress]];
                     }];
    
//    [UIView performWithoutAnimation:^{
//        [self.headerView setBackgroundColor:[self fadeFromColor:colours[from] toColor:colours[to] withPercentage:progress]];
//    }];
}

// this is a more generic method to fade between two colours
// it allows the colours to be passed in as parameters
- (UIColor *)fadeFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor withPercentage:(CGFloat)percentage
{
    // get the RGBA values from the colours
    CGFloat fromRed, fromGreen, fromBlue, fromAlpha;
    [fromColor getRed:&fromRed green:&fromGreen blue:&fromBlue alpha:&fromAlpha];
    
    CGFloat toRed, toGreen, toBlue, toAlpha;
    [toColor getRed:&toRed green:&toGreen blue:&toBlue alpha:&toAlpha];
    
    //calculate the actual RGBA values of the fade colour
    CGFloat red = (toRed - fromRed) * percentage + fromRed;
    CGFloat green = (toGreen - fromGreen) * percentage + fromGreen;
    CGFloat blue = (toBlue - fromBlue) * percentage + fromBlue;
    CGFloat alpha = (toAlpha - fromAlpha) * percentage + fromAlpha;
    
    // return the fade colour
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark - UICollectionView Data Source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexpath = %@", indexPath);
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc] init];
    }
    cell.backgroundColor = indexPath.item%2 == 0 ? [UIColor redColor] : [UIColor greenColor];
    
    return cell;
}
#pragma mark - UICollectionView Delegate



@end
