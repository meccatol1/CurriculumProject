//
//  CPPortThread.h
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 7..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPPortThread : NSThread <NSPortDelegate>
@property NSPort *remotePort;
@end

