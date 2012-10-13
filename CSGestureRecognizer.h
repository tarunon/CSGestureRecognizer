//
//  CSGestureRecognizer.h
//  TabWeb
//
//  Created by tarunon on 12/02/05.
//  Copyright (c) 2012年 Nobuo Saito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockGestureRecognizer.h"
#define RequireAxisDif 5.0f
#define RequirePointDif 40.0f

@interface CSGestureRecognizer : UIGestureRecognizer{
    CGPoint startPoint;
    NSMutableString *cmd;
}

@property (readonly, nonatomic) NSString *command;

@end
