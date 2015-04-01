//
//  StoryCreate&Add.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "StoryCreate&Add.h"
#import "StoryAdd.h"

@interface PicturesViewController : UIViewController <UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) UIImage* send;


- (IBAction)takeAPicture:(id)sender;
- (IBAction)viewPictureLibrary:(id)sender;

@end
