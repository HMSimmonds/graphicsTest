@import <Foundation/CPObject.j>

@import "DesignController.j"
@import "Link.j"


@implementation AppController : CPObject
{
        @outlet     CPWindow                theWindow;
        @outlet     CPView                  contentView;   
                    DesignController        designControlView       @accessors;


}
    
- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
    [contentView setNeedsDisplay:true];

}

- (void)awakeFromCib
{
    [theWindow setFullPlatformWindow:YES];
    contentView = [theWindow contentView];
    [contentView setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
    

    //create instance of WorkflowDesignerView
    designControlView = [[DesignController alloc] initController];

    [contentView addSubview:designControlView];

    // [contentView setNeedsDisplay:true];
    [theWindow orderFront:self];
}


@end

