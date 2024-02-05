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
    //[super viewDidLoad];
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
    NSLog(@"Hello, From Screenshoot deltected");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Screenshot Detected" message:@"Screenshots are not allowed in this app." preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
