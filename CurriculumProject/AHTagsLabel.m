//
//  AHTagsLabel.m
//  AutomaticHeightTagTableViewCell
//
//  Created by WEI-JEN TU on 2016-07-16.
//  Copyright © 2016 Cold Yam. All rights reserved.
//

#import "AHTagsLabel.h"
#import "AHTagView.h"

@implementation AHTagsLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self setupGesture];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setup];
    [self setupGesture];
}

- (void)setup {
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.textAlignment = NSTextAlignmentLeft;
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = YES;
}

- (void)setupGesture {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(tap:)];
    [self addGestureRecognizer:recognizer];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)tap:(UITapGestureRecognizer *)recognizer {
    UILabel *label = (UILabel *)recognizer.view;
    CGSize labelSize = recognizer.view.bounds.size;
    
    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:labelSize];
    container.lineFragmentPadding = 0.0;
    container.lineBreakMode = label.lineBreakMode;
    container.maximumNumberOfLines = label.numberOfLines;
    
    NSLayoutManager *manager = [NSLayoutManager new];
    [manager addTextContainer:container];
    
    NSTextStorage *storage = [[NSTextStorage alloc] initWithAttributedString:label.attributedText];
    [storage addLayoutManager:manager];
    
    CGPoint touchPoint = [recognizer locationInView:label];
    NSInteger indexOfCharacter = [manager characterIndexForPoint:touchPoint
                                                 inTextContainer:container
                        fractionOfDistanceBetweenInsertionPoints:nil];

    AHTag *tag = _tags[indexOfCharacter];
    NSNumber *selected = [tag selected];
    tag.selected = [NSNumber numberWithBool:!selected.boolValue];
    [self setTags:_tags];
}

#pragma mark - Tags setter

- (void)setTags:(NSArray<AHTag *> *)tags {
    _tags = tags;
    
    UITableViewCell *cell = [UITableViewCell new];
    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
    for (NSInteger i = 0; i < tags.count; i++) {
        AHTag *tag = tags[i];
        NSString *title = tag.title;
        UIColor *color = tag.color;
        NSNumber *selected = tag.selected;
        color = selected.boolValue == YES ? color : [UIColor lightGrayColor];
        
        AHTagView *view = [AHTagView new];
        view.label.attributedText = [AHTagsLabel attributedString:title];
        view.label.backgroundColor = color;
        
        CGSize size = [view systemLayoutSizeFittingSize:view.frame.size
                          withHorizontalFittingPriority:UILayoutPriorityFittingSizeLevel
                                verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
        view.frame = CGRectMake(0, 0, size.width + 20, size.height);
        [cell.contentView addSubview:view];
        
        UIImage *image = view.image;
        NSTextAttachment *attachment = [NSTextAttachment new];
        attachment.image = image;
        
        NSAttributedString *attrStr = [NSAttributedString attributedStringWithAttachment:attachment];
        [mutableString beginEditing];
        [mutableString appendAttributedString:attrStr];
        [mutableString endEditing];
    }
    
    self.attributedText = mutableString;
}

#pragma mark - NSAttributedString

+ (NSAttributedString *)attributedString:(NSString *)string {
    NSMutableParagraphStyle *paragraphStyle =  [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.firstLineHeadIndent = 10.0f;
    paragraphStyle.headIndent = 10.0f;
    paragraphStyle.tailIndent = 10.0f;
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName  : paragraphStyle,
                                 NSFontAttributeName            : [UIFont boldSystemFontOfSize:14.0]
                                 };
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:string
                                                                         attributes:attributes];
    return attributedText;
}

@end
