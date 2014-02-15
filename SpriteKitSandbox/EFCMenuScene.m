//
//  EFCMyScene.m
//  SpriteKitSandbox
//
//  Created by Giordano Scalzo on 15/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCMenuScene.h"
#import "SKSpriteButtonNode.h"
#import "EFCCarScene.h"

@implementation EFCMenuScene

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
        
        [self createBtnTitle:@"Car"
                       block:^(id buttonNode){
                           SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
                           EFCCarScene *newScene = [[EFCCarScene alloc] initWithSize: self.size];
                           [self.scene.view presentScene: newScene transition: reveal];
                       }
                    position:CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMidY(self.frame) + BTN_HEIGHT)
         ];
        [self createBtnTitle:@"Parallax"
                       block:^(id buttonNode){
                           NSLog(@"Parallax");
                       }
                    position:CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMidY(self.frame))
         ];
        [self createBtnTitle:@"Hammer"
                       block:^(id buttonNode){
                           NSLog(@"Hammer");
                       }
                    position:CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMidY(self.frame) - BTN_HEIGHT)
         ];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
