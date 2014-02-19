//
//  EFCMyScene.m
//  SpriteKitSandbox
//
//  Created by Giordano Scalzo on 15/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCMenuScene.h"
#import "SKSpriteButtonNode+Extra.h"
#import "EFCCarScene.h"
#import "EFCParallaxScrollingScene.h"

@implementation EFCMenuScene

#pragma mark - Lifecycle

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        [self setupButtons];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


#pragma mark - Creators
- (void)setupButtons {
    NSUInteger BTN_HEIGHT = 40;
    [self addChild:
     [SKSpriteButtonNode buttonTitle:@"Car"
                               block:^(id buttonNode){
                                   SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
                                   EFCCarScene *newScene = [[EFCCarScene alloc] initWithSize: self.size];
                                   [self.scene.view presentScene: newScene transition: reveal];
                               }
                            position:CGPointMake(CGRectGetMidX(self.frame),
                                                 CGRectGetMidY(self.frame) + BTN_HEIGHT)
      ]];
    [self addChild:
     [SKSpriteButtonNode buttonTitle:@"Parallax"
                               block:^(id buttonNode){
                                   SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
                                   EFCParallaxScrollingScene *newScene = [[EFCParallaxScrollingScene alloc] initWithSize: self.size];
                                   [self.scene.view presentScene: newScene transition: reveal];
                               }
                            position:CGPointMake(CGRectGetMidX(self.frame),
                                                 CGRectGetMidY(self.frame))
      ]];
    [self addChild:
     [SKSpriteButtonNode buttonTitle:@"Hammer"
                               block:^(id buttonNode){
                                   NSLog(@"Hammer");
                               }
                            position:CGPointMake(CGRectGetMidX(self.frame),
                                                 CGRectGetMidY(self.frame) - BTN_HEIGHT)
      ]];
}

@end
