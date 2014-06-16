@import <AppKit/CPWindowController.j>
@import <Foundation/CPObject.j>


@implementation Seed : CPView
{
    CPBox               seed                @accessors;
    CPUInteger          numberOfPages       @accessors;

    CPArray             pages               @accessors;

    CPButton            attributesButton    @accessors;

}

- (id)initWithPoint:(CGPoint)aPoint size:(CGSize)aSize pageNum:(CPUInteger)pageNum
{
    var aRect = CGRectMake(aPoint.x, aPoint.y, aSize.height, aSize.width);
    self = [super initWithFrame:aRect];

    if (self)
    {
        seed = [[CPBox alloc] initWithFrame:aRect];

        // attributesButton = [[CPButton alloc] initWithFrame:CGRectMake(12.5, 2.5, 7.5, 7.5)];

        [self addSubview:seed];
        [self setBounds:aRect];
        // [self addSubview:attributesButton];

    }
    return self;
}

- (void)changeBoxAttributes:(float)borderWidth cornerRadius:(float)cornerRadius fillColor:(CPColor)aColor boxType:(CPBoxType)type title:(CPString)aTitle 
{
        [seed setBorderWidth:borderWidth];
        [seed setCornerRadius:cornerRadius];
        [seed setFillColor:aColor];
        [seed setBoxType:type];
        [seed setBorderColor:[CPColor colorWithHexString:"CC3300"]];
        [seed setTitle:aTitle];
        // [seed setTitlePosition:6];
}

- (void)mouseEntered:(CPEvent)anEvent
{
    console.log("Entered");
}

- (void)mouseExited:(CPEvent)anEvent
{
    
}

@end