//
//  Square.h
//  KeyValueObserving
//
//  Created by Rusty Zarse on 10/20/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Square : NSObject {
	float sideLength;
	float canvasWidth;
	float canvasHeight;
}

@property(nonatomic) float sideLength;
@property(nonatomic) float canvasWidth;
@property(nonatomic) float canvasHeight;

-(id) initWithSideLength: (float) side andCanvasWidth: (float) width andHeight: (float) height;
-(CGPoint) getOrigin;
-(CGRect) getCenteredFrame;

@end
