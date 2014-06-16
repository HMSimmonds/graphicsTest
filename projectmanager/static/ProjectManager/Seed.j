@import <AppKit/CPWindowController.j>
@import <Foundation/CPObject.j>


@implementation Seed : CPView
{
    CPBox               seed                @accessors;
    CPUInteger          numberOfPages       @accessors;

    CPArray             pages               @accessors;

    CPButton            attributesButton    @accessors;

    CPView              infoView            @accessors;

}

- (id)initWithPoint:(CGPoint)aPoint size:(CGSize)aSize pageNum:(CPUInteger)pageNum
{
    var aRect = CGRectMake(aPoint.x, aPoint.y, aSize.height, aSize.width);
    self = [super initWithFrame:aRect];
    // self = [super initWithFrame:CGRectMake(aPoint.x, aPoint.y, aSize.height + 100, aSize.width + 100.0)];


    if (self)
    {
        seed = [[CPBox alloc] initWithFrame:aRect];

        // attributesButton = [[CPButton alloc] initWithFrame:CGRectMake(12.5, 2.5, 7.5, 7.5)];

        [self addSubview:seed];
        [self setBounds:aRect];
        // [self addSubview:attributesButton];

        [infoView = [[CPView alloc] initWithFrame:CGRectMake(aPoint.x + aSize.height, aPoint.y, 55.0, 20.0)]];
        [infoView setBackgroundColor:[CPColor colorWithHexString:"FFFF99"]];
        var label = [[CPTextField alloc] initWithFrame:CGRectMake(aPoint.x + aSize.height, aPoint.y, 55.0, 20.0)];
        [label setStringValue:"Pages: "];

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
    console.log("Entered Seed");
    [self addSubview:infoView];
}

- (void)mouseExited:(CPEvent)anEvent
{

    [infoView removeFromSuperview];
}

- (void)mouseDown:(CPEvent)anEvent
{
    console.log("SEED");
}

@end