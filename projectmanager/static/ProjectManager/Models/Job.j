@import <Ratatosk/WLRemoteTransformers.j>



@implementation Job : WLRemoteObject
{

    CPString        pk                  @accessors;
    CPString        uuid                @accessors;
    CPString        jobName             @accessors;
    CPString        author              @accessors;
    CPString        description         @accessors;
    CPString        category            @accessors;
    BOOL            isInteractive       @accessors;
    CPArray         settings            @accessors;
    CPArray         inputTypes          @accessors;
    CPArray         outputTypes         @accessors;

    CPImage         sourceListIcon      @accessors;
}

- (id)init
{
    if (self = [super init])
    {
        sourceListIcon = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"job-sourcelist-icon.png"]
                                  size:CGSizeMake(16.0, 16.0)];

    }
    return self;
}

- (CPString)shortJobName
{
    var shortName = jobName,
        splitString = [shortName componentsSeparatedByString:"."];
    if ([splitString count] > 1)
    {
        shortName = [[splitString lastObject] stringByReplacingOccurrencesOfString:@"_" withString:@" "];
        return [shortName capitalizedString];
    }
    return shortName;
}


+ (CPArray)remoteProperties
{
    return [
        ['uuid', 'uuid'],
        ['jobName', 'job_name'],
        ['author', 'author'],
        ['category', 'category'],
        ['description', 'description'],
        ['outputTypes', 'output_types'],
        ['inputTypes', 'input_types'],
        ['isEnabled', 'enabled'],
        ['isInteractive', 'interactive']
    ];
}

- (CPString)remotePath
{
    if ([self pk])
    {
        return [self pk]
    }
    else
    {
        return @"/jobs/";
    }
}

@end