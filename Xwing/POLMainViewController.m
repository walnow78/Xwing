//
//  POLMainViewController.m
//  Xwing
//
//  Created by Pawel Walicki on 6/4/15.
//  Copyright (c) 2015 Pawel Walicki. All rights reserved.
//

#import "POLMainViewController.h"

@interface POLMainViewController ()

@end

@implementation POLMainViewController

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Creamos un detector de Tap
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(didTap:)];
    
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(didSwip:)];
    
    // Lo añadimos
    
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:swip];
}

-(void) didTap:(UITapGestureRecognizer*) tap{
    
    // Bloque de animación
    

    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseInOut;
    
    //Translación
    
    [UIView animateWithDuration:1.0
                          delay:0
                        options:options
                     animations:^{
                         
                         // Estado final
                         
                         self.xwingView.center = [tap locationInView:self.spaceView];
                         
                       //  self.xwingView.alpha = 0.0f;

                         
                     } completion:^(BOOL finished) { // El finished indica si ha finalizado con éxito
                         
                         self.xwingView.alpha = 1.0f;
                         
                     }];
    
    // Rotación
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.xwingView.transform = CGAffineTransformMakeRotation(M_2_PI);
                     } completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:1
                                               delay:0
                                             options:0
                                          animations:^{
                                              
                                              self.xwingView.transform = CGAffineTransformIdentity;
                                              
                                          } completion:^(BOOL finished) {
                                             
                                              
                                              
                                          }];
                         
                     }];
    
    
    
}

-(void) didSwip:(UISwipeGestureRecognizer*) swip{
    
    [UIView animateWithDuration:1.0
                          delay:0
                        options:0
                     animations:^{
                         
                         // Desaparece xwing
                         
                        self.xwingView.alpha = 0.0f;
                         
                     } completion:^(BOOL finished) {
                         
                         // Calculo la posicion aleatoria
                         
                         CGFloat x = (CGFloat) (arc4random() % (int) self.view.bounds.size.width);
                         CGFloat y = (CGFloat) (arc4random() % (int) self.view.bounds.size.height);
                         
                         // Muevo el xwing
                         
                         [UIView animateWithDuration:0.5
                                               delay:0
                                             options:0
                                          animations:^{
                                              
                                              // Estado final
                                              
                                              self.xwingView.center = CGPointMake(x,y);
                                              
                                              
                                          } completion:^(BOOL finished) {
                                              
                                              // Aparece xwing
                                              
                                              [UIView animateWithDuration:1.0
                                                                    delay:0
                                                                  options:0
                                                               animations:^{
                                                                   
                                                                   self.xwingView.alpha = 1.0f;
                                                                   
                                                               } completion:^(BOOL finished) {
                                                                   
                                                               }];

                                              
                                          }];
                     }];

    
}

@end
