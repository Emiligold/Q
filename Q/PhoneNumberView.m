//
//  PhoneNumberView.m
//  Q
//
//  Created by Noga badhav on 22/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "PhoneNumberView.h"

@interface PhoneNumberView ()

@property (weak, nonatomic) IBOutlet UITextField *firstNumbers;
@property (weak, nonatomic) IBOutlet UITextField *secondNumbers;
@property (weak, nonatomic) IBOutlet UITextField *thirdNumbers;

@end

@implementation PhoneNumberView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)sendValidationCode:(id)sender
{
    if (self.firstNumbers.text.length == 3 && self.secondNumbers.text.length == 3 && self.thirdNumbers.text.length == 4)
    {
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.content.textColor = [UIColor colorWithRed:(125/255.0) green:(128/255.0) blue:(130/255.0) alpha:1];
    self.content.layer.shadowColor = [self.content.textColor CGColor];
    self.content.layer.shadowOffset = CGSizeMake(2.5, 2.5);
    self.content.layer.shadowRadius = 3.5;
    self.content.layer.shadowOpacity = 0.0;
    self.firstNumbers.delegate = self;
    [self.firstNumbers addTarget:self
                  action:@selector(textFieldFirst:)
        forControlEvents:UIControlEventEditingChanged];
    self.secondNumbers.delegate = self;
    [self.secondNumbers addTarget:self
                          action:@selector(textFieldSecond:)
                forControlEvents:UIControlEventEditingChanged];
    self.thirdNumbers.delegate = self;
    self.thirdNumbers.tag = 3;
    [self.firstNumbers becomeFirstResponder];
    [self.secondNumbers setEnabled:NO];
    [self.thirdNumbers setEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)textFieldFirst:(id)sender
{
    if (self.firstNumbers.text.length == 3)
    {
        [self.firstNumbers resignFirstResponder];
        [self.secondNumbers setEnabled:YES];
        [self.secondNumbers becomeFirstResponder];
    }
}

-(IBAction)textFieldSecond:(id)sender
{
    if (self.secondNumbers.text.length == 3)
    {
        [self.secondNumbers resignFirstResponder];
        [self.thirdNumbers setEnabled:YES];
        [self.thirdNumbers becomeFirstResponder];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    return textField.tag == 3 ? newLength <= 4 : newLength <= 3;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
