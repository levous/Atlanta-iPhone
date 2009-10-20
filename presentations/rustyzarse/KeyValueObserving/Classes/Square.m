//
//  Square.m
//  KeyValueObserving
//
//  Created by Rusty Zarse on 10/20/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import "Square.h"


@implementation Square
@synthesize sideLength, canvasWidth, canvasHeight;
-(id) initWithSideLength: (float) side andCanvasWidth: (float) width andHeight: (float) height{
	if( self == [super init] ){
		[self setSideLength:side];
		[self setCanvasWidth:width];
		[self setCanvasHeight:height];
	}
	return self;
}

-(CGPoint) getOrigin{
	CGPoint origin = CGPointMake( ( ( [self canvasWidth] / 2 ) - ( [self sideLength] / 2 ) ), ( ( [self canvasHeight] / 2 ) - ( [self sideLength] / 2 ) ) );
	return origin;
}

-(CGRect) getCenteredFrame{
	CGPoint origin = [self getOrigin];
	CGRect frame = CGRectMake( origin.x, origin.y, [self sideLength], [self sideLength]);
	return frame;
	
}

@end
