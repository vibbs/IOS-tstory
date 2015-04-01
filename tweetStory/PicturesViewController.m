//
//  StoryCreate&Add.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "PicturesViewController.h"

@interface PicturesViewController ()



@end

@implementation PicturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSLog(@"Entered picture view ");
    NSLog(@"%@",_send);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
 
 if ([[segue identifier] isEqual:@"startstory"]) {
 StoryCreate_Add *vc = segue.destinationViewController;
 UIImage *p = _send;
 
 
 NSLog(@"This is the selected image sent to start story");
  NSLog(@"%@",_send);
 vc.media = p;
 }

}


- (IBAction)takeAPicture:(id)sender {
    
    // Checking if the camera is available
    // If not then tell the user
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device does not have a camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
        [myAlertView show];
    }
    // If it is, then use it to take a picture
    else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (IBAction)viewPictureLibrary:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    _send = chosenImage;
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImageWriteToSavedPhotosAlbum(chosenImage, nil, nil, nil);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}













@end
