//
//  SKSpriteButtonNode+Extra.m
//  SpriteKitSandbox
//
//  Created by Giordano Scalzo on 15/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "SKSpriteButtonNode+Extra.h"

@implementation SKSpriteButtonNode (Extra)

+ (instancetype)buttonTitle:(NSString *)btnLabel block:(void (^)(id))block position:(CGPoint)position
{
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    myLabel.text = btnLabel;
    myLabel.fontSize = 16;
    
    SKSpriteButtonNode *button1 = [SKSpriteButtonNode buttonWithBackgroundTexture:nil
                                                                        labelNode:myLabel
                                                                            block:block];
    button1.position = position;
    return button1;
}

@end
