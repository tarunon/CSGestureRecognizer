//
//  CSGestureRecognizer.m
//  TabWeb
//
//  Created by tarunon on 12/02/05.
//  Copyright (c) 2012年 Nobuo Saito. All rights reserved.
//

#import "CSGestureRecognizer.h"

@implementation CSGestureRecognizer
@synthesize command = _command;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (touches.count != 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    cmd = [NSMutableString stringWithString:@"."];
    startPoint = [[touches anyObject] locationInView:self.view];
    self.state = UIGestureRecognizerStateBegin;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    if (touches.count != 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    CGPoint nowPoint = [[touches anyObject] locationInView:self.view];
    CGPoint prevPoint = [[touches anyObject] previousLocationInView:self.view];
    CGFloat x = nowPoint.x - prevPoint.x;
    CGFloat y = nowPoint.y - prevPoint.y;
    if (fabsf(x) - 5 > fabsf(y)) {
        x = nowPoint.x - startPoint.x;
        if (x > 40) {
            if (![cmd hasSuffix:@"→"]) {
                [cmd appendString:@"→"];
                startPoint = nowPoint;
            } else {
                startPoint.x = nowPoint.x;
            }
        } else if (x < -40) {
            if (![cmd hasSuffix:@"←"]) {
                [cmd appendString:@"←"];
                startPoint = nowPoint;
            } else {
                startPoint.x = nowPoint.x;
            }
        }
    } else if (fabsf(x) < fabsf(y) - 5) {
        y = nowPoint.y - startPoint.y;
        if (y > 40) {
            if (![cmd hasSuffix:@"↓"]) {
                [cmd appendString:@"↓"];
                startPoint = nowPoint;
            } else {
                startPoint.y = nowPoint.y;
            }
        } else if (y < -40) {
            if (![cmd hasSuffix:@"↑"]) {
                [cmd appendString:@"↑"];
                startPoint = nowPoint;
            } else {
                startPoint.y = nowPoint.y;
            }
        }
    }
    _command = [cmd substringFromIndex:1];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    if (touches.count > 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    if (cmd.length <= 1) {
        self.state = UIGestureRecognizerStateFailed;
    }
    _command = [cmd substringFromIndex:1];
    self.state = UIGestureRecognizerStateEnded;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
}

@end
