#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <objc/runtime.h>

#import "Aspects.h"
#import "CPDColors.h"
//#import "Deckset.h"

@interface DecksetInject : NSObject

@end

#pragma mark -

@implementation DecksetInject

+ (void)makeSelector:(SEL)sel returnColor:(NSColor*)color inThemeClassNamed:(const char*)themeClassName {
    [objc_getClass(themeClassName) aspect_hookSelector:sel
                                           withOptions:AspectPositionInstead
                                            usingBlock:^(id<AspectInfo> info) {
                                                NSInvocation *invocation = info.originalInvocation;
                                                [invocation invoke];
                                                
                                                NSColor* myColor = color;
                                                [invocation setReturnValue:&myColor];
                                            } error:NULL];
}

+ (void)load {
    NSLog(@"Loaded DecksetInject");

    [self makeSelector:@selector(backgroundColor)
           returnColor:[NSColor colorWithRed:0.631 green:0.341 blue:0.91 alpha:1]
     inThemeClassNamed:"Stylesheet"];
}

@end
