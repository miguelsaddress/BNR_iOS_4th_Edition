//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 26/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController


-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"Remind me";
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

-(IBAction)addReminder:(id)sender
{
    NSDate * date = self.datePicker.date;

    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize meeeeeeee";
    note.fireDate = date;
    NSLog(@"Notification <%@>", note);
    NSLog(@"date <%@>", date);
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end
