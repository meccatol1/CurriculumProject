//
//  CPMainTableViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 28..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPMainTableViewController.h"

#import "CPSplitViewController.h"
#import "CPDetail_1_ViewController.h"
#import "CPDetail_2_ViewController.h"

@interface CPMainTableViewCell : UITableViewCell

@end

@implementation CPMainTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        NSLog(@"initWithCoder");
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
//    NSLog(@"awakeFromNib");
}

@end

@interface CPMainTableViewController ()

@end

@implementation CPMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.definesPresentationContext = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CPMainTableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd cell", indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"didSelectRowAtIndexPath %@", indexPath);
    
    if (indexPath.row < 1) {
        CPSplitViewController *controller = (CPSplitViewController *)self.splitViewController;
        [controller selectIndex:indexPath.row];
    }else {
        if (indexPath.row < 4) {
            CPDetail_2_ViewController *controller = (CPDetail_2_ViewController *)
            [self.storyboard instantiateViewControllerWithIdentifier:@"CPDetail_2_ViewController"];
            controller.modalPresentationStyle = UIModalPresentationCurrentContext;
            
            NSLog(@"startPresenting, %@", controller.view);
            
            if (indexPath.row == 1) {
                [self presentViewController:controller
                                   animated:YES
                                 completion:nil];
            }else if (indexPath.row == 2) {
                [self showViewController:controller sender:self];
            }else if (indexPath.row == 3) {
                [self showDetailViewController:controller sender:self];
            }
        }else {
            CPDetail_1_ViewController *controller = (CPDetail_1_ViewController *)
            [self.storyboard instantiateViewControllerWithIdentifier:@"CPDetail_1_ViewController"];
            
            [self showDetailViewController:controller sender:self];
        }
    }
}

@end
