//
//  ViewController.m
//  news
//
//  Created by Vineela Mallipeddi on 2/1/17.
//  Copyright © 2017 goli. All rights reserved.
//

#import "ViewController.h"
#import "svc.h"



@interface ViewController (){
    NSArray *array;
    NSString *URLString;
   
}



@end



@implementation ViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title=@"Home";
   
    
    // Do any additional setup after loading the view, typically from a nib.
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}
-(void)getCountryInfo{
    
    NSString *apiurl=@"https://newsapi.org/v1/articles?sortBy=top&apiKey=ef3ac4e040e24b0a89007686cbb701de&source=";
    NSString *finalurl=[apiurl stringByAppendingString:URLString];
    NSURL *url = [NSURL URLWithString:finalurl];
    
    
    
    [self downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
    
        // Check if any data returned.
        
        if (data != nil) {
            
            
            
            // Convert the returned data into a dictionary.
            
            NSError *error;
            
            NSMutableDictionary *returnedDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            
            
            if (error != nil) {
                
                NSLog(@"%@", [error localizedDescription]);
                
            }
            
            else{
                
                
                 NSLog(@"%@",returnedDict);
                array = [returnedDict valueForKey:@"articles"];
                
                
                [self getdataout];
                
          
                
            }
            
            
            
        }
        
    }];
    
    
    
    
}
-(void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void (^)(NSData *))completionHandler{
    
    // Instantiate a session configuration object.
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
    
    // Instantiate a session object.
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    
    
    // Create a data task object to perform the data downloading.
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        
        if (error != nil) {
            
            // If any error occurs then just display its description on the console.
            
            NSLog(@"%@", [error localizedDescription]);
            
        }
        
        else{
            
            // If no error occurs, check the HTTP status code.
            
            NSInteger HTTPStatusCode = [(NSHTTPURLResponse *)response statusCode];
            
            
            
            // If it's other than 200, then show it on the console.
            
            if (HTTPStatusCode != 200) {
                
                NSLog(@"HTTP status code = %ld", (long)HTTPStatusCode);
                
            }
            
            
            
            // Call the completion handler with the returned data on the main thread.
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                completionHandler(data);
                
            }];
            
        }
        
    }];
    
    
    
    // Resume the task.
    
    [task resume];
    
}


-(void)getdataout{
    NSLog(@"total news %lu",(unsigned long)array.count);
    
    
    svc *svc= [self.storyboard instantiateViewControllerWithIdentifier:@"svc"];
    svc.data=array;
    
    [self.navigationController pushViewController:svc animated:YES];
}


- (IBAction)nextstep:(id)sender {
    URLString = @"the-times-of-india" ;
    [self getCountryInfo];
}

- (IBAction)TheHindu:(id)sender {
    URLString = @"the-hindu" ;
    [self getCountryInfo];
}

- (IBAction)BBC:(id)sender {
    URLString = @"bbc-news" ;
    [self getCountryInfo];
}

- (IBAction)CNN:(id)sender {
    URLString = @"cnn" ;
    [self getCountryInfo];
}
- (IBAction)ThenewYorktimes:(id)sender {
    URLString = @"the-new-york-times" ;
    [self getCountryInfo];
}
- (IBAction)FoxSports:(id)sender {
    URLString = @"fox-sports" ;
    [self getCountryInfo];
}
- (IBAction)NationalGeographic:(id)sender {
    URLString = @"national-geographic" ;
    [self getCountryInfo];
}
- (IBAction)BBCSports:(id)sender {
    URLString = @"bbc-sport" ;
    [self getCountryInfo];
}
- (IBAction)Business:(id)sender {
    URLString = @"business-insider" ;
    [self getCountryInfo];
}
- (IBAction)CNBC:(id)sender {
    URLString = @"cnbc" ;
    [self getCountryInfo];
}
- (IBAction)DailyMail:(id)sender {
    URLString = @"daily-mail" ;
    [self getCountryInfo];
}
- (IBAction)Engadget:(id)sender {
    URLString = @"engadget" ;
    [self getCountryInfo];
}
- (IBAction)FortuneTimes:(id)sender {
    URLString = @"usa-today" ;
    [self getCountryInfo];
}
- (IBAction)IGN:(id)sender {
    URLString = @"ign" ;
    [self getCountryInfo];
}
- (IBAction)MTVNews:(id)sender {
    URLString = @"mtv-news" ;
    [self getCountryInfo];
}
- (IBAction)NewScientist:(id)sender {
    URLString = @"new-scientist" ;
    [self getCountryInfo];
}
- (IBAction)NewyorkMagzine:(id)sender {
    URLString = @"new-york-magazine" ;
    [self getCountryInfo];
}
- (IBAction)NFL:(id)sender {
    URLString = @"nfl-news" ;
    [self getCountryInfo];
}
- (IBAction)Recode:(id)sender {
    URLString = @"recode" ;
    [self getCountryInfo];
}
- (IBAction)Reddit:(id)sender {
    URLString = @"reddit-r-all" ;
    [self getCountryInfo];
}
- (IBAction)TechRadar:(id)sender {
    URLString = @"techradar" ;
    [self getCountryInfo];
}
- (IBAction)WSJ:(id)sender {
    URLString = @"the-wall-street-journal" ;
    [self getCountryInfo];
}
- (IBAction)Time:(id)sender {
    URLString = @"time" ;
    [self getCountryInfo];
}
- (IBAction)USAToday:(id)sender {
    
}

@end
