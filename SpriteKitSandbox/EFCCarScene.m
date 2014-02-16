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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self createSceneContents];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    [self createCar:location];
}

#pragma mark - Creators
- (void)setupButtons {
//    NSUInteger BTN_HEIGHT = 40;
    [self addChild:
     [SKSpriteButtonNode buttonTitle:@"Back"
                               block:^(id buttonNode){
                                   SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
                                   EFCMenuScene *newScene = [[EFCMenuScene alloc] initWithSize: self.size];
                                   [self.scene.view presentScene: newScene transition: reveal];
                               }
                            position:CGPointMake(CGRectGetMidX(self.frame),
                                                 300)
      ]];
    [self createSceneContents];
}

- (void) createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    SKSpriteNode *sn = [SKSpriteNode spriteNodeWithImageNamed:@"space_bg"];
    
    sn.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    sn.name = @"BACKGROUND";
    sn.zPosition = -1;
    
    [self addChild:sn];
    self.scaleMode = SKSceneScaleModeAspectFit;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
}

#pragma mark - car
- (SKShapeNode*) makeWheel
{
    SKShapeNode *wheel = [[SKShapeNode alloc] init];
    CGMutablePathRef myPath = CGPathCreateMutable();
    CGPathAddArc(myPath, NULL, 0,0, 16, 0, M_PI*2, YES);
    wheel.path = myPath;
    return wheel;
}

- (void) createCar:(CGPoint)location
{
    // 1. car body
    SKSpriteNode *carBody = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(120, 15)];
    carBody.position = location;
    carBody.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:carBody.size];
    [self addChild:carBody];
    
    // 2. wheels
    SKShapeNode *leftWheel = [self makeWheel];
    leftWheel.position = CGPointMake(carBody.position.x - carBody.size.width / 2, carBody.position.y);
    leftWheel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:16];
    [self addChild:leftWheel];
    
    SKShapeNode *rightWheel = [self makeWheel];
    rightWheel.position = CGPointMake(carBody.position.x + carBody.size.width / 2, carBody.position.y);
    rightWheel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:16];
    [self addChild:rightWheel];
    
    SKShapeNode *centerWheel = [self makeWheel];
    centerWheel.position = CGPointMake(carBody.position.x , carBody.position.y);
    centerWheel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:16];
    [self addChild:centerWheel];
    
    // 3. Join wheels to car
    SKPhysicsJointSpring *joinLeft = [SKPhysicsJointSpring jointWithBodyA:carBody.physicsBody bodyB:leftWheel.physicsBody anchorA:leftWheel.position anchorB:leftWheel.position];
    joinLeft.damping = .5;
    [self.physicsWorld addJoint:joinLeft];
    SKPhysicsJointSpring *joinRight = [SKPhysicsJointSpring jointWithBodyA:carBody.physicsBody bodyB:rightWheel.physicsBody anchorA:rightWheel.position anchorB:rightWheel.position];
    joinRight.damping = .5;
    [self.physicsWorld addJoint:joinRight];

    SKPhysicsJointSpring *joinCenter = [SKPhysicsJointSpring jointWithBodyA:carBody.physicsBody bodyB:centerWheel.physicsBody anchorA:centerWheel.position anchorB:centerWheel.position];
    joinCenter.damping = .5;
    [self.physicsWorld addJoint:joinCenter];
    
    // 4. drive car
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [leftWheel.physicsBody applyTorque:-120];
    });
}


@end
