//
//  SKSpriteButtonNode+Extra.h
//  SpriteKitSandbox
//
//  Created by Giordano Scalzo on 15/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "SKSpriteButtonNode.h"

@interface SKSpriteButtonNode (Extra)

+ (instancetype)buttonTitle:(NSString *)btnLabel block:(void (^)(id))block position:(CGPoint)position;

@end
