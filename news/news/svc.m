//
//  svc.m
//  news
//
//  Created by Vineela Mallipeddi on 2/1/17.
//  Copyright © 2017 goli. All rights reserved.
//

#import "svc.h"
#import "nextcell.h"
#import "ViewController.h"

@interface svc (){
    NSArray *array1;
    NSArray *urldata;
}
@property (weak, nonatomic) IBOutlet UIWebView *page;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityindicator;

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;

@end

@implementation svc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view endEditing:YES];
    self.navigationController.navigationBar.hidden=YES;
    array1=_data;
    NSLog(@"total news %lu",(unsigned long)array1.count);
    
    //Hide the webpage and activity indicator.
    _page.hidden=YES;
    _back.enabled=false;
    _activityindicator.hidden=YES;
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  array1.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableidentifier=@"sample";
    nextcell *cell=[tableView  dequeueReusableCellWithIdentifier:tableidentifier];
    if (cell==nil) {
        
        cell=[[nextcell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableidentifier];
    }
    
    // Load the values into the objects in the cell.
    cell.title.text=[[array1 objectAtIndex:indexPath.row] valueForKey:@"title"];
    
   
    cell.decription.text=[[array1 objectAtIndex:indexPath.row] valueForKey:@"description"];
    
    urldata=[[array1 objectAtIndex:indexPath.row] valueForKey:@"url"];
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[array1 objectAtIndex:indexPath.row] valueForKey:@"urlToImage"]]];
   
    cell.pic.image= [UIImage imageWithData: imageData];
    NSLog(@"array is %@",urldata);
    
    return cell;
}

//Load the webview if the row is selected.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [_activityindicator startAnimating];
    _page.hidden=false;
    _back.enabled=true;
    
    _tableview.hidden=true;
    _activityindicator.hidden=false;
    NSString *urlstring=[[array1 objectAtIndex:indexPath.row] valueForKey:@"url"];
    NSURL *url=[NSURL URLWithString:urlstring];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [_page loadRequest:request];
    
  
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityindicator stopAnimating];
    
    
}

- (IBAction)backaction:(id)sender {
    _page.hidden=YES;
    _back.enabled=false;
    _tableview.hidden=false;
}
- (IBAction)home:(id)sender {
    ViewController *fvc= [self.storyboard instantiateViewControllerWithIdentifier:@"fvc"];
    [self.navigationController pushViewController:fvc animated:YES];
    self.title=@"Home";
}

@end
