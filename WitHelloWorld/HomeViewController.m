#import "HomeViewController.h"
#import "DivClient.h"
#import "Element.h"
#import <AFNetworking/AFNetworking.h>

@interface HomeViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *exampleView;
@property (weak, nonatomic) IBOutlet UIView *elementsView;
@property (weak, nonatomic) IBOutlet UIView *examplesView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *exampleTap;
@property (weak, nonatomic) IBOutlet UILabel *examplesLabel;
@property (weak, nonatomic) IBOutlet UILabel *logoLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.logoLabel.font = [UIFont fontWithName:@"Billabong" size:45];
    self.logoLabel.hidden = YES;
    
    self.elementsView.hidden = YES;
    self.examplesView.hidden = YES;
    
    self.exampleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizer)];
    [self.exampleView addGestureRecognizer:self.exampleTap];
    
    // border
    [self.exampleView.layer setCornerRadius:15.0f];
    [self.exampleView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.exampleView.layer setBorderWidth:1.5f];

    // set the WitDelegate object
    [Wit sharedInstance].delegate = self;

    // create the button
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat w = 70;
    
    CGRect rect = CGRectMake(screen.size.width/2 - w/2, 0 , w, w);

    WITMicButton* witButton = [[WITMicButton alloc] initWithFrame:rect];
    [self.view addSubview:witButton];
    
    [UIView animateWithDuration:1
                     animations:^{
                         CGRect frame = witButton.frame;
                         frame.origin.y += 439;
                         witButton.frame = frame;
                     }
                     completion:^(BOOL finished){
                         
                         self.examplesLabel.text = @"Examples";
                         self.examplesView.hidden = NO;
                         self.elementsView.hidden = YES;
                         self.logoLabel.hidden = NO;
                         self.examplesView.alpha = 0;
                         self.logoLabel.alpha = 0;
                         
                         [UIView beginAnimations:@"fade in" context:nil];
                         [UIView setAnimationDuration:0.5];
                         self.examplesView.alpha = 1.0;
                         [self.examplesView setBackgroundColor:[UIColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:0.0]];
                         [UIView commitAnimations];
                         
                         [UIView beginAnimations:@"fade in" context:nil];
                         [UIView setAnimationDuration:0.5];
                         self.logoLabel.alpha = 1.0;
                         [self.logoLabel setBackgroundColor:[UIColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:0.0]];
                         [UIView commitAnimations];
                     }
     ];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(buttonIndex == 0) { //NO
        
    } else { //YES
        
    }
}

- (void)makeGetElementesRequest {
    [[DivClient singletonInstance] syncAllDataWithListener:self];
}

- (BOOL)gestureRecognizer {
    self.exampleView.backgroundColor = [UIColor whiteColor];
    if([@"Examples" isEqualToString:self.examplesLabel.text]) {
        self.examplesLabel.text = @"Elements";
        self.elementsView.hidden = YES;
        self.examplesView.hidden = NO;
        self.examplesView.alpha = 0;
        
        [UIView beginAnimations:@"fade in" context:nil];
        [UIView setAnimationDuration:0.5];
        self.examplesView.alpha = 1.0;
        [self.elementsView setBackgroundColor:[UIColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:0.0]];
        [UIView commitAnimations];
        
    } else {
        self.examplesLabel.text = @"Examples";
        self.examplesView.hidden = YES;
        self.elementsView.hidden = NO;
        self.elementsView.alpha = 0;
        
        [UIView beginAnimations:@"fade in" context:nil];
        [UIView setAnimationDuration:0.5];
        self.elementsView.alpha = 1.0;
        [self.elementsView setBackgroundColor:[UIColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:0.0]];
        [UIView commitAnimations];
    }
    self.exampleView.backgroundColor = [UIColor clearColor];
    return YES;
}

- (void)showRemoveDialog {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                    message:@"Are you sure you want to delete this. This action cannot be undone"
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)witDidGraspIntent:(NSString *)intent entities:(NSDictionary *)entities body:(NSString *)body error:(NSError *)e {
    
    if (e) {
        NSLog(@"[Wit] error: %@", [e localizedDescription]);
        return;
    }
    
    if([intent isEqualToString:@"REMOVE"]) {
        [self showRemoveDialog];
    }
    
    NSString *type = [[entities objectForKey:@"type"] objectForKey:@"value"];
    NSString *html = [[entities objectForKey:@"html"] objectForKey:@"value"];
    NSInteger parent = [[[entities objectForKey:@"parent"] objectForKey:@"value"] intValue];
    NSInteger elementID = [[[entities objectForKey:@"elementID"] objectForKey:@"value"] intValue];
    
//    NSString *backgroundColor = [[entities objectForKey:@"background-color"] objectForKey:@"value"];
//    NSString *fontSize = [[entities objectForKey:@"font-size"] objectForKey:@"value"];
//    NSString *fontWeight = [[entities objectForKey:@"font-weight"] objectForKey:@"value"];
//    NSString *borderRadius = [[entities objectForKey:@"border-radius"] objectForKey:@"value"];
//    
//    NSArray *styles = @[backgroundColor, fontSize, fontWeight, borderRadius];
//    

    Element *command = [Element elementCommandWithIntent:intent withType:type withHTML:html withParent:parent withElementID:elementID withStyles:nil];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSLog(@"%@", command);
    
//    for(int i = 0; i < 5; i++) {
//        NSDictionary *params = @ {[NSString stringWithFormat:@"best %d", i] :[NSString stringWithFormat:@"best %d", i], @"pwd" :@"behaviour" };
        [manager POST:@"http://hack-magenta.herokuapp.com/action" parameters:command success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
//    }
}

@end
