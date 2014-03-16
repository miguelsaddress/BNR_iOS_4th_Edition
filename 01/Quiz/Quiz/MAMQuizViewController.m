//
//  MAMQuizViewController.m
//  Quiz
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 16/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import "MAMQuizViewController.h"

@interface MAMQuizViewController ()

@property(nonatomic) int currentQuestionIndex;

@property(nonatomic, copy) NSArray *questions;
@property(nonatomic, copy) NSArray *answers;

@property(nonatomic, weak) IBOutlet UILabel *questionLabel;
@property(nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation MAMQuizViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        self.currentQuestionIndex = -1;
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    
    }
    //Returning the address of the new object
    return self;
}

-(IBAction)showQuestion:(id)sender
{
    //Pointing to next question
    self.currentQuestionIndex++;
    
    //if we finished the questions, lets start from the beginning
    if(self.currentQuestionIndex == [self.questions count]){
        self.currentQuestionIndex = 0;
    }
    //Assigning the question's text to the label
    self.questionLabel.text = self.questions[self.currentQuestionIndex];
    
    //Showing the empty answer text in the answer label
    self.answerLabel.text = @"???";
}

-(IBAction)showAnswer:(id)sender
{
    //Replacing the empty answer text for the right answer's text
    self.answerLabel.text = self.answers[self.currentQuestionIndex];
}

@end
