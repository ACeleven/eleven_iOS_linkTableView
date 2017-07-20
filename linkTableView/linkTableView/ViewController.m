//
//  ViewController.m
//  linkTableView
//
//  Created by eleven on 2017/7/20.
//  Copyright © 2017年 eleven. All rights reserved.
//

#import "ViewController.h"
#import "LinkTableOneViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *myBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, eleWIDTH, 50)];
    [myBtn setTitle:@"TableView联动" forState:UIControlStateNormal];
    [myBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [myBtn addTarget:self action:@selector(BtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)BtnAction{
    LinkTableOneViewController *VC = [[LinkTableOneViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
