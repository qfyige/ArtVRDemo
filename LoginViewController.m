//
//  LoginViewController.m
//  Login
//
//  Created by tong lele on 16/6/29.
//  Copyright © 2016年 tong lele. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginHelper.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

-(void)dealloc{
    [self.codeTF removeObserver:self forKeyPath:@"text"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.codeTF addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    self.phoneTF.text = @"18510871368";
    self.codeTF.text = @"1234";
    self.codeTF.delegate = self;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *targetString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(targetString.length == 4){
        [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    }else{
        [self.loginButton setTitle:@"验证" forState:UIControlStateNormal];
    }

    return  YES;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSString *code = [change objectForKey:@"new"];
    if(code.length == 4){
        [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    }else{
        [self.loginButton setTitle:@"验证" forState:UIControlStateNormal];
    }
    
}


- (IBAction)clickBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)clickMoreButton:(id)sender {
    
}
- (IBAction)clickCheckButton:(id)sender {
    if([self.loginButton.titleLabel.text isEqualToString:@"验证"]){
        NSLog(@"获取验证码");
    }else{
        [LoginHelper logIn];
        [self dismissViewControllerAnimated:YES completion:^{
        
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
