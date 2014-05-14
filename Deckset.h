@interface PosterColorScheme7 : NSObject

@property(retain, nonatomic) NSColor *backgroundColor;
@property(retain, nonatomic) NSColor *darkTextColor;
@property(nonatomic) double imageAlpha;
@property(retain, nonatomic) NSColor *lightTextColor;

@end

#pragma mark -

@interface Stylesheet : NSObject

@property(retain, nonatomic) TextStyle *listItem;
@property(retain, nonatomic) TextStyle *list;
@property(retain, nonatomic) TextStyle *quoteAuthor;
@property(retain, nonatomic) TextStyle *strong;
@property(retain, nonatomic) TextStyle *inlineCodeBlock;
@property(retain, nonatomic) TextStyle *link;
@property(retain, nonatomic) TextStyle *emphasis;
@property(retain, nonatomic) TextStyle *code;
@property(retain, nonatomic) TextStyle *paragraph;
@property(retain, nonatomic) TextStyle *blockQuote;

@property(retain, nonatomic) TextStyle *header6;
@property(retain, nonatomic) TextStyle *header5;
@property(retain, nonatomic) TextStyle *header4;
@property(retain, nonatomic) TextStyle *header3;
@property(retain, nonatomic) TextStyle *header2;
@property(retain, nonatomic) TextStyle *header1;

@end

#pragma mark -

@interface TextStyle : NSObject

@property(copy, nonatomic) NSString *family;

@end
