#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

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
           returnColor:[NSColor ortaOrange]
     inThemeClassNamed:"PosterColorScheme7"];
    
    [self makeSelector:@selector(lightTextColor)
           returnColor:[NSColor alloyBlue]
     inThemeClassNamed:"PosterColorScheme7"];
    
    [self makeSelector:@selector(darkTextColor)
           returnColor:[NSColor kyleBrown]
     inThemeClassNamed:"PosterColorScheme7"];

    [objc_getClass("TextStyle") aspect_hookSelector:@selector(family)
                                        withOptions:AspectPositionInstead
                                         usingBlock:^(id<AspectInfo> info) {
                                             NSInvocation *invocation = info.originalInvocation;
                                             [invocation invoke];

                                             NSString* family = @"GT Walsheim";
                                             [invocation setReturnValue:&family];
                                         } error:NULL];
}

@end
