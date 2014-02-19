//
//  EFCParallaxScrollingScene.m
//  SpriteKitSandbox
//
//  Created by Giordano Scalzo on 19/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCParallaxScrollingScene.h"
#import "PBParallaxScrolling.h"

@interface EFCParallaxScrollingScene ()

@property (nonatomic, strong) PBParallaxScrolling * parallaxBackground;

@end

@implementation EFCParallaxScrollingScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.scaleMode = SKSceneScaleModeAspectFit;
        NSArray * imageNames = @[@"pForeground.png", @"pMiddle.png", @"pBackground.png"];
        PBParallaxScrolling * parallax = [[PBParallaxScrolling alloc] initWithBackgrounds:imageNames size:size direction:kPBParallaxBackgroundDirectionLeft fastestSpeed:kPBParallaxBackgroundDefaultSpeed andSpeedDecrease:kPBParallaxBackgroundDefaultSpeedDifferential];
        self.parallaxBackground = parallax;
        [self addChild:parallax];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    [self.parallaxBackground reverseMovementDirection];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [self.parallaxBackground update:currentTime];
}

@end
