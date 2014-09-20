#import "HomeViewController.h"
#import "DivClient.h"

@interface HomeViewController ()
    @property(nonatomic, strong) DivClient *client;
@end

@implementation HomeViewController 
    UILabel *labelView;


- (void)viewDidLoad
{
    [super viewDidLoad];

    // set the WitDelegate object
    [Wit sharedInstance].delegate = self;

    // create the button
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat w = 70;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    CGRect rect = CGRectMake(screen.size.width/2 - w/2, screenHeight - 5 * w/3 , w, w);

    WITMicButton* witButton = [[WITMicButton alloc] initWithFrame:rect];
    [self.view addSubview:witButton];

    // create the label
    labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, screen.size.width, 50)];
    labelView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelView];
    [self makeGetElementsRequest];
}

-(void)makeGetElementsRequest {
    [[DivClient singletonInstance] syncAllDataWithListener:self];
}

-(void)witDidGraspIntent:(NSString *)intent entities:(NSDictionary *)entities body:(NSString *)body error:(NSError *)e {
    if (e) {
        NSLog(@"[Wit] error: %@", [e localizedDescription]);
        return;
    }

    labelView.text = [NSString stringWithFormat:@"intent = %@", intent];

    [self.view addSubview:labelView];
}

#pragma mark <DivClientListener>

-(void)requestSucceeded {
    
}
-(void)requestFailed {
    
}

@end
