@import <AppKit/CPPanel.j>
@import "ToolsView.j"

@implementation ToolPanel : CPPanel
{
    CPArray     tools;
}

- (id)init 
{
    self = [self initWithContentRect:CGRectMake(0.0, 0.0, 350.0, 500.0)
                           styleMask:CPHUDBackgroundWindowMask |
                                     CPClosableWindowMask | 
                                     CPResizableWindowMask];

    if (self)
    {
        [self setTitle:"Workflow Objects"];
        [self setFloatingPanel:NO];

        var contentView = [self contentView],
            bounds = [contentView bounds];

        bounds.size.height -= 20.0;

        var toolsView = [[CPCollectionView alloc] initWithFrame:bounds];

        [toolsView setAutoresizingMask:CPViewWidthSizable];
        [toolsView setMinItemSize:CGSizeMake(50, 200)];
        [toolsView setMaxItemSize:CGSizeMake(50, 200)];

        var itemPrototype = [[CPCollectionViewItem alloc] init],
            toolView = [[ToolsView alloc] initWithFrame:CGRectMakeZero()];

        [itemPrototype setView:toolView];

        var scrollView = [[CPScrollView alloc] initWithFrame:bounds];

        [scrollView setDocumentView:toolsView];
        [scrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        [scrollView setAutohidesScrollers:YES];

        [[scrollView contentView] setBackgroundColor:[CPColor whiteColor]];

        [contentView addSubview:scrollView];

        //assign array of views  and set

        // [toolsView setContent:objectArray];
    }
    return self;
}



@end