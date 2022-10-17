//
//  ViewController.m
//  PopCat
//
//  Created by Mercen on 2022/10/17.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *Cat;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property int Counts;

@end

@implementation ViewController

-(void)getHttpCallBack{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]
                                       initWithURL:[NSURL URLWithString:@"http://10.80.163.136:7000/1"]];
    [urlRequest setHTTPMethod:@"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableDictionary *s = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSNumber* output = [s valueForKey:@"counts"];
        self.Counts = [output intValue];
    }];
    [dataTask resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getHttpCallBack];
    self.Label.text = @"Welcome";
    self.Cat.image = [UIImage imageNamed:@"Close.png"];
}

- (IBAction)ButtonTouchEnded:(UIButton *)sender {
    [self getHttpCallBack];
    self.Label.text = [NSString stringWithFormat:@"%d", self.Counts];
    self.Cat.image = [UIImage imageNamed:@"Close.png"];
}

- (IBAction)ButtonTouchDown:(UIButton *)sender {
    self.Cat.image = [UIImage imageNamed:@"Open.png"];
}

@end
