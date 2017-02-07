//
//  ViewController.m
//  UItextField
//
//  Created by Vladislav Kalaev on 07.02.17.
//  Copyright © 2017 Vladislav Kalaev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //  self.firstNameField.keyboardAppearance = UIKeyboardAppearanceDark; // тоже самое можно было сделать в сториборде,
 //   self.lastNameField.keyboardAppearance = UIKeyboardAppearanceLight; // но это для саморазвития
      self.firstNameField.autocorrectionType = UITextAutocorrectionTypeNo; // тоже и для автокорекции
      self.lastNameField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    [self.firstNameField becomeFirstResponder]; // когда загрузится наше приложение фокус будет на поле ввода имени
    
    // чтобы человек не нажимал на поле ввода
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationTextDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidChangeEditing:) name:UITextFieldTextDidChangeNotification object:nil];
    

    
    
}

- (void) dealloc { // когда мы подписались на нотификации а потом контреллер уничтожился, то нотификации будут приходит в мусор и будет падать приложение
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)actionLog:(id)sender { // это хорошо когда нам нужно отправлять данные на сервер
    
    NSLog(@"firsе name = %@, Last Name = %@ ", self.firstNameField.text,self.lastNameField.text);
    
    if ([self.firstNameField isFirstResponder ]) { // убираем клавиатуру если на имени
        [self.firstNameField resignFirstResponder];
    }else if  ([self.lastNameField isFirstResponder]){ // убираем клавиатуру если на фамилии
        [self.lastNameField resignFirstResponder];
    }
    
}

- (IBAction)actionTextChanged:(UITextField *)sender { // тут нам приходит textfield не

    NSLog(@"%@, ", sender.text); // выводится сразу же написанный текст
    
}

# pragma mark - UITextFieldDelegate


//- (BOOL)textFieldShouldClear:(UITextField *)textField {

  //  return YES;
    
//}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.firstNameField]) {
        [self.lastNameField becomeFirstResponder]; // becomeFirstResponder объект на котором есть фокус
        
    }else {
        [textField resignFirstResponder];
    }
    
     return YES;
}

# pragma mark - NSNotification


-(void) notificationTextDidBeginEditing:(NSNotification*) notification{
    
    NSLog(@"notificationTextDidBeginEditing");
}

-(void) notificationTextDidEndEditing:(NSNotification*) notification{
    
    NSLog(@"notificationTextDidEndEditing");
}

-(void) notificationTextDidChangeEditing:(NSNotification*) notification{
    
    NSLog(@"notificationTextDidChangeEditing");
}



@end







