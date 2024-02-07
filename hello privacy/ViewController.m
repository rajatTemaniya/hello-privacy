//
//  ViewController.m
//  hello privacy
//
//  Created by Rajat Temaniya on 05/02/24.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *instructionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(screenshotTaken)
                                                     name:UIApplicationUserDidTakeScreenshotNotification
                                                   object:nil];
    NSLog(@"Hello, From view did load!");
    
    // Add instruction label
    [self addInstructionLabel];
   
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Manually call screenshotTaken for testing purposes, Uncomment below line for testing
    //[self screenshotTaken];
}


- (void)addInstructionLabel {
    self.instructionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 50)];
    self.instructionLabel.text = @"Take the screenshot";
    self.instructionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.instructionLabel];
}


- (void)screenshotTaken {
    // Respond to screenshot event here
    // For example, you can present an alert or disable user interaction
    NSLog(@"Hello, From Screenshoot detected");
    
    // Create overlay view
    UIView *overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
    overlayView.backgroundColor = [UIColor whiteColor]; // White background

    // Add label to overlay view
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(overlayView.frame), 50)];
    messageLabel.text = @"Screenshots are not allowed";
    messageLabel.textColor = [UIColor blackColor];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.center = overlayView.center;
    [overlayView addSubview:messageLabel];
    
    // Add overlay view to the main view
    [self.view addSubview:overlayView];
    
    // Remove overlay view after a delay (e.g., 3 seconds)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [overlayView removeFromSuperview];
    });
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
