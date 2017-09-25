//
//  RssTableViewController.m
//  RssReaderExample
//
//  Created by Артем Ковалев on 18.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import "RssTableViewController.h"
#import "RssTableViewCell.h"
#import "Post.h"
#import "UIColor+mainColors.h"
#import "RssWebViewController.h"
#import "RssWebViewModel.h"
//#import "RssTableViewModel.h"

@interface RssTableViewController ()
@property (nonatomic, retain) RssTableViewModel *model;
@end

@implementation RssTableViewController

+ (id)initWithModel:(RssTableViewModel *)tableViewModel{
    return [[[RssTableViewController alloc]initWithModel:tableViewModel]autorelease];
}
- (id)initWithModel:(RssTableViewModel *)tableViewModel{
    self = [super init];
    if(self){
        _model = tableViewModel;
        _model.parentController = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor rssTableViewBackgroundColor]];
    [self.tableView registerClass:[RssTableViewCell class] forCellReuseIdentifier:[RssTableViewCell cellReuseIdentifier]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.model startParseRSS];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [_model release];
    [super dealloc];
}

-(void)parseDidEnd{
    [self.navigationItem setTitle:self.model.feedChannel.title];
    [self.tableView reloadData];
}

#pragma mark - TableView Methods



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.feedPosts.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Post *post = [self.model.feedPosts objectAtIndex:indexPath.row];
    NSString *title = post.title;
    NSString *desc = post.description;
    return [RssTableViewCell expectedCellSizeForTitle:title desc:desc];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RssTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[RssTableViewCell cellReuseIdentifier]];
    Post *post = [self.model.feedPosts objectAtIndex:indexPath.row];
    NSString *title = post.title;
    NSString *desc = post.description;
    [cell setTitle:title desc:desc];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Post *post = [self.model.feedPosts objectAtIndex:indexPath.row];
    RssWebViewModel *webModel = [[RssWebViewModel alloc]initWithPost:post];
    RssWebViewController *wVC = [[RssWebViewController alloc]initWithModel:webModel];
    [self.navigationController pushViewController:wVC animated:YES];
//    [webModel release];
//    [wVC release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
 
}

@end
