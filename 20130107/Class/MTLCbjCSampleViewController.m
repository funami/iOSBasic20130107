//
//  MTLCbjCSampleViewController.m
//  20130107
//
//  Created by Takao Funami on 2013/01/07.
//  Copyright (c) 2013年 Takao Funami. All rights reserved.
//

#import "MTLCbjCSampleViewController.h"
#import "MTLCobjDetailViewController.h"
#import "MTLWebViewController.h"


@interface MTLCbjCSampleViewController ()

@property (nonatomic,strong) NSMutableArray *listData;
@property (nonatomic,strong) NSArray *listData2;
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;

@end

@implementation MTLCbjCSampleViewController

#pragma mark - 配列操作
- (NSMutableArray *)listData{
    if (!_listData){
        
        // リテラルの便利な使い方2 - Mutableオブジェクトの初期化も簡単

        _listData = [[NSMutableArray alloc] init];

        //_listData = @[].mutableCopy;  //Xcode4.5

    }
    return _listData;
}
- (IBAction)addData:(id)sender {
    NSDate *date = [NSDate date];
    [self.listData addObject:date];
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // View作成時に入れておく
    // 3つの都市の情報をWikiペディアからコピーしておく
    // リテラルの便利な使い方1 - 配列、辞書の生成が簡易になった。

    NSDictionary *item1 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"ロンドン",@"name",
                           [NSNumber numberWithInt:8174100],@"population",
                           @"London_collage.jpg",@"image",
                           @"http://ja.m.wikipedia.org/wiki/ロンドン",@"url",
                           nil];
    NSDictionary *item2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"東京",@"name",
                           [NSNumber numberWithInt:13216221],@"population",
                           @"250px-Tokyo_Montage_2012.png",@"image",
                           @"http://ja.m.wikipedia.org/wiki/東京",@"url",
                           nil];
    NSDictionary *item3 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"ニューヨーク",@"name",
                           [NSNumber numberWithInt:8175133],@"population",
                           @"NYC_Montage_2011.jpg",@"image",
                           @"http://ja.m.wikipedia.org/wiki/ニューヨーク",@"url",
                           nil];
    
    self.listData2 = [NSArray arrayWithObjects:item1,item2,item3, nil];
    
    
    /*
    //Xcode4.5 こんなにらくちん key:valueの位置が直感的にあってる & 配列の最後にnilを入れたりしない
    NSDictionary *item1 = @{
        @"name":@"ロンドン",
        @"population":@8174100,
        @"image":@"London_collage.jpg",
        @"url":@"http://ja.m.wikipedia.org/wiki/ロンドン"};
    
    NSDictionary *item2 = @{
        @"name":@"東京",
        @"population":@13216221,
        @"image":@"250px-Tokyo_Montage_2012.png",
        @"url":@"http://ja.m.wikipedia.org/wiki/東京"};
    
    NSDictionary *item3 = @{
        @"name":@"ニューヨーク",
        @"population":@8175133,
        @"image":@"NYC_Montage_2011.jpg",
        @"url":@"http://ja.m.wikipedia.org/wiki/ニューヨーク"};
    
    self.listData2 = @[item1,item2,item3];
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0){
        return [self.listData2 count];
    }else{
        return [self.listData count];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section ==0){
        return @"静的な配列のデータの一覧";
    }else{
        return @"タイムスタンプ配列に追加";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    UITableViewCell *cell;
    if (indexPath.section == 0){
        static NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        NSDictionary *item = [self.listData2 objectAtIndex:row];
        cell.textLabel.text = [item objectForKey:@"name"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"人口:%@人",[item objectForKey:@"population"]];
        /*
        NSDictionary *item = self.listData2[row];  //配列の添字でのアクセスが可能に！
        cell.textLabel.text = item[@"name"];    //辞書はkey名で呼べる便利！
        cell.detailTextLabel.text = [NSString stringWithFormat:@"人口:%@人",item[@"population"]];
        */
        
    }else{
        static NSString *CellIdentifier = @"Cell2";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        NSDate *date = [self.listData objectAtIndex:row];
        cell.textLabel.text = date.description;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"timeIntervalSince1970:%f",[date timeIntervalSince1970]];
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    // Segueを使うので、ここでは、なにもしないが、よばれてはいる
    NSLog(@"didSelectRowAtIndexPath");
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // do a segue based on the indexPath or do any setup later in prepareForSegue
    // ちょっと、かっちょわるいけど、indexPathを一時的にインスタンス変数に保持
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"showWiki" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
     //ここで、データを詳細画面のプロパティに渡す。
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath.section == 0){
            NSDictionary *item = self.listData2[indexPath.row];
            [[segue destinationViewController] setDetailItem:item];
        }
    }else if([[segue identifier] isEqualToString:@"showWiki"]){
        if (self.selectedIndexPath.section == 0){
            NSDictionary *item = self.listData2[self.selectedIndexPath.row];
            [[segue destinationViewController] setDetailItem:item];
        }
    }
    
}



@end
