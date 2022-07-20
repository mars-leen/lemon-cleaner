//
//  LMBackButton.m
//  QMUICommon
//
//  
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "LMBackButton.h"

@implementation LMBackButton

-(void)setUp{
    [self setButtonType:NSButtonTypeMomentaryChange];
    self.bordered = NO;
    
    NSBundle* bundle = [NSBundle bundleForClass:self.class];
    self.defaultImage = [bundle imageForResource:@"back_btn_normal"];
    self.hoverImage = [bundle imageForResource:@"back_btn_hover"];
    self.downImage = [bundle imageForResource:@"back_btn_down"];
    
    self.defaultTitleColor = [NSColor colorWithHex:0x94979b];
    self.hoverTitleColor = [NSColor colorWithHex:0xafafaf];
    self.downTitleColor = [NSColor colorWithHex:0x7e7e7e];
    
    [super setUp];
}

@end
