//
//  LinkTableOneViewController.m
//  linkTableView
//
//  Created by eleven on 2017/7/20.
//  Copyright © 2017年 eleven. All rights reserved.
//

#import "LinkTableOneViewController.h"

@interface LinkTableOneViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, strong) NSArray *leftDataSource;
@property (nonatomic, strong) NSArray *rightDataSource;

@end

@implementation LinkTableOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"TableView联动";
    
    [self loadData];
    
    // Do any additional setup after loading the view.
}

-(void)loadData{
    _leftDataSource = @[@"left1",@"left2",@"left3",@"left4",@"left5",@"left6",@"left7",@"left8",@"left9",@"left10",@"left11",@"left12",@"left13",@"left14",@"left15",@"left16",@"left17",@"left18",@"left19",@"left20"];
    
    _rightDataSource = @[@"right1",@"right2",@"right3",@"right4",@"right5",@"right6",@"right7",@"right8",@"right9",@"right10"];
    
    [self loadTableView];
    
}

-(void)loadTableView{
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
}


#pragma mark --- UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _leftTableView) {
        return 1;
    }
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTableView) {
        return 20;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        return 50;
    }
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (tableView == _leftTableView)
        cell.textLabel.text = _leftDataSource[indexPath.row];
    else
        cell.textLabel.text = [NSString stringWithFormat:@"%@--%@",_leftDataSource[indexPath.section],_rightDataSource[indexPath.row]];
        
    return cell;
}

-(UITableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc] init];
        _leftTableView.frame = CGRectMake(0, 0, 100, eleHEIGHT);
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _leftTableView;
}

-(UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc] init];
        _rightTableView.frame = CGRectMake(100, 64, eleWIDTH - 100, eleHEIGHT-64); //为什么这个TableView的Y值需要设成64？
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return  _rightTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTableView) {
        NSIndexPath *moveIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        
        //animated为YES会导致leftTableView选择乱跳
        [_rightTableView selectRowAtIndexPath:moveIndexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        [_rightTableView deselectRowAtIndexPath:moveIndexPath animated:YES];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == self.rightTableView) {
        NSIndexPath *topIndexPath = [[_rightTableView indexPathsForVisibleRows]firstObject];
        NSIndexPath *moveIndexPath = [NSIndexPath indexPathForRow:topIndexPath.section inSection:0];
        
        [_leftTableView selectRowAtIndexPath:moveIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];

    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
