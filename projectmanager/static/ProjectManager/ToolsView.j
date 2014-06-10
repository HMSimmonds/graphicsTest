

@implementation ToolsView : CPView
{
    CPView          aToolView;

}


//sets specific view in collection view to an object.. (coudl be a view)
- (void)setRepresentedObject:(id)anObject
{
    if (!aToolView)
    {
        var aFrame = CGRectInset([self bounds], 5.0, 5.0);

        aToolView = [[CPView alloc] initWithFrame:aFrame];

        [aToolView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];

        [self addSubview:aToolView];
    }
    //set to object
}

- (void)setSelected:(BOOL)isSelected
{
    [self setBackgroundColor:isSelected ? [CPColor grayColor] : nil];
}

@end