@import <Foundation/CPObject.j>

@import "WorkflowDesignerView.j"
@import "ToolPanel.j"


@implementation AppController : CPObject
{
        @outlet     CPWindow                theWindow;
        // @outlet     ToolPanel               toolsPanel;
        @outlet     CPView                  contentView;   
        
        // @outlet     CPView                  toolsCollectionView;
        @outlet     CPPopUpButton           pullOutButtonNumberWorkflows    @accessors;
        @outlet     CPTextField             workflowNumberLabel             @accessors;
                    WorkflowDesignerView    designerView                    @accessors;


}
    
- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
    [contentView setNeedsDisplay:true];

    

}

- (void)awakeFromCib
{
    // [theWindow setFullPlatformWindow:YES];
    contentView = [theWindow contentView];
    [contentView setBackgroundColor:[CPColor colorWithHexString:"E5A2T6"]];
    
    //create instance of WorkflowDesignerView
    designerView = [[WorkflowDesignerView alloc] initDesigner];

    [contentView addSubview:designerView];

    // [contentView setNeedsDisplay:true];
    [theWindow orderFront:self];

    [[[ToolPanel alloc] init] orderFront:nil];


    //toolsPanel setup



}


@end

