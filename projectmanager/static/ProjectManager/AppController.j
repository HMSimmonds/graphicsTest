@import <Foundation/CPObject.j>

@import "WorkflowDesignerView.j"
@import "ToolPanel.j"


@implementation AppController : CPObject
{
    @outlet             CPWindow            theWindow               @accessors;
    @outlet             CPView              contentView             @accessors;
                        CGRect              _theWindowBounds;
                        CPScrollView        contentScrollView;
    
    @outlet             CPSplitView         workflowDesignerView    @accessors;
    @outlet             CPView              designerView            @accessors;
    @outlet             CPSplitView         leftSideBar             @accessors;
    @outlet             CPSplitView         rightSideBar            @accessors;


}
    
- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
    [contentView setNeedsDisplay:true];

    

}

- (void)awakeFromCib
{
    [theWindow setFullPlatformWindow:YES];
    _theWindowBounds = [contentView bounds];

    //init contentView attributes
    [contentView setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
    [contentView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    
    //add scrollView on contentView
    contentScrollView = [[CPScrollView alloc] initWithFrame:[contentView bounds]];
    [contentScrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [contentScrollView setHasHorizontalScroller:YES];
    [contentScrollView setHasVerticalScroller:YES];
    [contentScrollView setAutohidesScrollers:YES];
    [contentView setSubviews:[contentScrollView]];

    
    [workflowDesignerView setFrame:_theWindowBounds];
    [workflowDesignerView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [contentView addSubview:workflowDesignerView];


    //create instance of WorkflowDesignerView
    designerView = [[WorkflowDesignerView alloc] initDesigner];
    [designerView setFrame:CGRectMake(300.0, 0.0, CGRectGetWidth(_theWindowBounds) - 600.0, CGRectGetHeight(_theWindowBounds))];
    [designerView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [designerView setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];

    //left Side Bar
    [leftSideBar setFrame:CGRectMake(0.0, 0.0, 300.0, CGRectGetHeight(_theWindowBounds))];
    [leftSideBar setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [leftSideBar setBackgroundColor:[CPColor colorWithHexString:"CCCCCC"]];


    //Right Side Bar
    [rightSideBar setFrame:CGRectMake(CGRectGetWidth(_theWindowBounds) - 300.0, 0.0, 300.0, CGRectGetHeight(_theWindowBounds))];
    [rightSideBar setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
    [rightSideBar setBackgroundColor:[CPColor colorWithHexString:"CCCCCC"]];



    // [contentView setAutoresizesSubviews:YES];

    [theWindow orderFront:self];




}


@end

