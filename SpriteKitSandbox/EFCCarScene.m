//
//  EFCCarScene.m
//  SpriteKitSandbox
//
//  Created by Giordano Scalzo on 15/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCCarScene.h"
#import "SKSpriteButtonNode+Extra.h"
#import "EFCMenuScene.h"

@implementation EFCCarScene

#pragma mark - Lifecycle

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        [self setupButtons];
    }
    return self;
}

#pragma mark - Creators
- (void)setupButtons {
    NSUInteger BTN_HEIGHT = 40;
    [self addChild:
     [SKSpriteButtonNode buttonTitle:@"Back"
                               block:^(id buttonNode){
                                   SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
                                   EFCMenuScene *newScene = [[EFCMenuScene alloc] initWithSize: self.size];
                                   [self.scene.view presentScene: newScene transition: reveal];
                               }
                            position:CGPointMake(CGRectGetMidX(self.frame),
                                                 BTN_HEIGHT)
      ]];
    [self createSceneContents];
}

- (void) createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    SKSpriteNode *sn = [SKSpriteNode spriteNodeWithImageNamed:@"space_bg"];
    
    sn.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    sn.name = @"BACKGROUND";
    
    [self addChild:sn];
    self.scaleMode = SKSceneScaleModeAspectFit;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
}

@end
