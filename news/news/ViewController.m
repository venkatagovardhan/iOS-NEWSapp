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
@property (weak, nonatomic) IBOutlet UIButton *timesofindia;


@end



@implementation ViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    _timesofindia.titleLabel.text= @"the-times-of-india";
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
}





- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}
-(void)getCountryInfo{
    
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    
    
    [self downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
        
        // Check if any data returned.
        
        if (data != nil) {
            
            //  NSLog(@"Data is %@",data);
            
            // Convert the returned data into a dictionary.
            
            NSError *error;
            
            NSMutableDictionary *returnedDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            
            
            if (error != nil) {
                
                NSLog(@"%@", [error localizedDescription]);
                
            }
            
            else{
                
                
                
                array = [returnedDict valueForKey:@"articles"];
                //NSString *name=[array valueForKey:@"title"];
                
                [self getdataout];
                
                
                
                //NSLog(@"Returned Dictionary is %@",[array valueForKey:@"title"]);
                //NSLog(@"%lu",(unsigned long)array.count);
                
                
                
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
    
    NSLog(@"total news %@",array1);
    svc *svc= [self.storyboard instantiateViewControllerWithIdentifier:@"svc"];
    svc.data=array;
    
    [self.navigationController pushViewController:svc animated:YES];
}


- (IBAction)nextstep:(id)sender {
    URLString = @"https://newsapi.org/v1/articles?sortBy=top&apiKey=ef3ac4e040e24b0a89007686cbb701de&source=the-times-of-india" ;
    [self getCountryInfo];
}

- (IBAction)TheHindu:(id)sender {
    URLString = @"https://newsapi.org/v1/articles?sortBy=top&apiKey=ef3ac4e040e24b0a89007686cbb701de&source=the-hindu" ;
    [self getCountryInfo];
}

- (IBAction)BBC:(id)sender {
    URLString = @"https://newsapi.org/v1/articles?sortBy=top&apiKey=ef3ac4e040e24b0a89007686cbb701de&source=bbc-news" ;
    [self getCountryInfo];
}

- (IBAction)CNN:(id)sender {
    URLString = @"https://newsapi.org/v1/articles?sortBy=top&apiKey=ef3ac4e040e24b0a89007686cbb701de&source=cnn" ;
    [self getCountryInfo];
}
- (IBAction)ThenewYorktimes:(id)sender {
    URLString = @"https://newsapi.org/v1/articles?sortBy=top&apiKey=ef3ac4e040e24b0a89007686cbb701de&source=the-new-york-times" ;
    [self getCountryInfo];
}
- (IBAction)ESPN:(id)sender {
    URLString = @"https://newsapi.org/v1/articles?sortBy=top&apiKey=ef3ac4e040e24b0a89007686cbb701de&source=espn" ;
    [self getCountryInfo];
}
- (IBAction)NationalGeographic:(id)sender {
    URLString = @"https://newsapi.org/v1/articles?sortBy=top&apiKey=ef3ac4e040e24b0a89007686cbb701de&source=national-geographic" ;
    [self getCountryInfo];
}


@end
