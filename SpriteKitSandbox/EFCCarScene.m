//
//  EFCCarScene.m
//  SpriteKitSandbox
//
//  Created by Giordano Scalzo on 15/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCCarScene.h"
#import "SKSpriteButtonNode.h"
#import "EFCMenuScene.h"

@implementation EFCCarScene

- (void)createBtnTitle:(NSString *)btnLabel block:(void (^)(id))block position:(CGPoint)position {
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    myLabel.text = btnLabel;
    myLabel.fontSize = 16;
    
    SKSpriteButtonNode *button1 = [SKSpriteButtonNode buttonWithBackgroundTexture:nil
                                                                        labelNode:myLabel
                                                                            block:block];
    button1.position = position;
    [self addChild:button1];
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        NSUInteger BTN_HEIGHT = 40;
        
        [self createBtnTitle:@"Back"
                       block:^(id buttonNode){
                           SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
                           EFCMenuScene *newScene = [[EFCMenuScene alloc] initWithSize: self.size];
                           [self.scene.view presentScene: newScene transition: reveal];
                       }
                    position:CGPointMake(CGRectGetMidX(self.frame),
                                         BTN_HEIGHT)
         ];
    }
    return self;
}

@end
