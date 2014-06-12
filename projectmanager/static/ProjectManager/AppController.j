@import <Foundation/CPObject.j>

@import "WorkflowDesignerView.j"
@import "ToolPanel.j"


@implementation AppController : CPObject
{
    @outlet             CPWindow                theWindow               @accessors;
    @outlet             CPView                  contentView             @accessors;
                        CGRect                  _theWindowBounds;
                        CPScrollView            contentScrollView;

    @outlet             CPSplitView             workflowDesignerView    @accessors;
    @outlet             CPView                  designerView            @accessors;
    @outlet             CPSplitView             leftSideBar             @accessors;
    @outlet             CPSplitView             rightSideBar            @accessors;

                        WorkflowDesignerView    workflowDiagram         @accessors;

    @outlet             CPToolbarItem           leftSideBarIcon         @accessors;
    @outlet             CPToolbarItem           rightSideBarIcon        @accessors;

    @outlet             CPButton                connectButton           @accessors;
    @outlet             CPButton                settingsButton          @accessors;
    @outlet             CPButton                pagesButton             @accessors;
    @outlet             CPButton                runsButton              @accessors;


                        CPBundle                theBundle               @accessors;

    @outlet             CPScrollView            jobScrollView           @accessors;
    @outlet             CPView                  jobsView                @accessors;
    @outlet             CPArray                 jobsViewArray           @accessors;

    @outlet             CPView                  jobA                    @accessors;
    @outlet             CPView                  jobB                    @accessors;
    @outlet             CPView                  jobC                    @accessors;
    @outlet             CPView                  jobD                    @accessors;
    @outlet             CPView                  jobE                    @accessors;
    @outlet             CPView                  jobF                    @accessors;
    @outlet             CPView                  jobG                    @accessors;
    @outlet             CPView                  jobH                    @accessors;
    @outlet             CPView                  jobI                    @accessors;

    @outlet             CPImageView             imageA;
    @outlet             CPImageView             imageB;
    @outlet             CPImageView             imageC;
    @outlet             CPImageView             imageD;
    @outlet             CPImageView             imageE;
    @outlet             CPImageView             imageF;
    @outlet             CPImageView             imageG;
    @outlet             CPImageView             imageH;
    @outlet             CPImageView             imageI;



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
    theBundle = [CPBundle mainBundle];



    //init. Bundle to resources

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

    


    

    [designerView setFrame:CGRectMake(300.0, 0.0, CGRectGetWidth(_theWindowBounds) - 600.0, CGRectGetHeight(_theWindowBounds))];
    [designerView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [designerView setAutoresizesSubviews:YES];
    [designerView setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
    
    //create instance of WorkflowDesignerView
    workflowDiagram = [[WorkflowDesignerView alloc] initDesigner];
    [workflowDiagram setFrame:[designerView bounds]];
    [designerView addSubview:workflowDiagram];

    //left Side Bar
    [leftSideBar setFrame:CGRectMake(0.0, 0.0, 300.0, CGRectGetHeight(_theWindowBounds))];
    [leftSideBar setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [leftSideBar setBackgroundColor:[CPColor colorWithHexString:"E6E6E6"]];


    //Right Side Bar
    [rightSideBar setFrame:CGRectMake(CGRectGetWidth(_theWindowBounds) - 300.0, 0.0, 300.0, CGRectGetHeight(_theWindowBounds))];
    [rightSideBar setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
    [rightSideBar setBackgroundColor:[CPColor colorWithHexString:"E6E6E6"]];

    var leftSideBarImageIcon = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"indent-increase.png"] size:CGSizeMake(15.0, 15.0)],
        rightSideBarImageIcon = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"indent-decrease.png"] size:CGSizeMake(15.0, 15.0)];

        [leftSideBarIcon setImage:leftSideBarImageIcon];
        [rightSideBarIcon setImage:rightSideBarImageIcon];


    // connectImage = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"connect.png"]];
    var connectImage = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"connect.png"] size:CGSizeMake(20.0, 20.0)];
    [connectButton setImage:connectImage];
    [connectButton setBordered:NO];

    var settingsImage = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"cog.png"] size:CGSizeMake(20.0, 20.0)];
    [settingsButton setImage:settingsImage];
    [settingsButton setBordered:NO];

    var pagesImage = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"file.png"] size:CGSizeMake(20.0, 20.0)];
    [pagesButton setImage:pagesImage];
    [pagesButton setBordered:NO];

    var runsImage = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"arrow-down.png"] size:CGSizeMake(20.0, 20.0)];
    [runsButton setImage:runsImage];
    [runsButton setBordered:NO];

    //job Scroll View

    var scrollBounds = [jobScrollView bounds];

    // [jobsView setFrame:CGRectMake(scrollBounds.origin.x, scrollBounds.origin.y + 10.0, scrollBounds.size.x, [jobsView bounds].size.y)];

    [jobScrollView setBackgroundColor:[CPColor colorWithHexString:"A6A6A6"]];
    [jobScrollView setDocumentView:jobsView];

    [imageA setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"contrast.png"] size:CGSizeMake(32.0, 32.0)]];
    [imageB setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"crop.png"] size:CGSizeMake(32.0, 32.0)]];
    [imageC setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"expand.png"] size:CGSizeMake(32.0, 32.0)]];
    [imageD setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"expand2.png"] size:CGSizeMake(32.0, 32.0)]];
    [imageE setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"image.png"] size:CGSizeMake(32.0, 32.0)]];
    [imageF setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"libreoffice.png"] size:CGSizeMake(32.0, 32.0)]];
    [imageG setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"music.png"] size:CGSizeMake(32.0, 32.0)]];
    [imageH setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"pen.png"] size:CGSizeMake(32.0, 32.0)]];
    [imageI setImage:[[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"table.png"] size:CGSizeMake(32.0, 32.0)]];

    jobsViewArray = [[CPArray alloc] init]; //used to keep track of jobs. could use controller ? 
    jobsViewArray[0] = jobA;
    jobsViewArray[1] = jobB;
    jobsViewArray[2] = jobC;
    jobsViewArray[3] = jobD;
    jobsViewArray[4] = jobE;
    jobsViewArray[5] = jobF;
    jobsViewArray[6] = jobG;
    jobsViewArray[7] = jobH;
    jobsViewArray[8] = jobI;

    for (var i = 0; i < [jobsViewArray count]; i++)
    {
        [jobsViewArray[i] setBackgroundColor:[CPColor colorWithHexString:"A6A6A6"]];
    };




    [theWindow orderFront:self];




}


@end

