//
//  ViewController.m
//  PopCat
//
//  Created by Mercen on 2022/10/17.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *Cat;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Cat.image = [UIImage imageNamed:@"Close.png"];
}

- (IBAction)ButtonTouchEnded:(UIButton *)sender {
    self.Cat.image = [UIImage imageNamed:@"Close.png"];
}

- (IBAction)ButtonTouchDown:(UIButton *)sender {
    self.Cat.image = [UIImage imageNamed:@"Open.png"];
}

@end
