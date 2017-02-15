//
//  nextcell.h
//  news
//
//  Created by Vineela Mallipeddi on 2/1/17.
//  Copyright © 2017 goli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nextcell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UITextView *decription;

@end
