//
//  ViewController.h
//  UItextField
//
//  Created by Vladislav Kalaev on 07.02.17.
//  Copyright © 2017 Vladislav Kalaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField* firstNameField;
@property (weak, nonatomic) IBOutlet UITextField* lastNameField;

- (IBAction)actionLog:(id)sender;

- (IBAction)actionTextChanged:(UITextField *)sender;


@end

