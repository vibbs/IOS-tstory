//
//  AddStoryPictureViewController.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 4/1/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStoryPictureViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) UIImage* send;


- (IBAction)takeAPicture:(id)sender;
- (IBAction)viewPictureLibrary:(id)sender;
@end
