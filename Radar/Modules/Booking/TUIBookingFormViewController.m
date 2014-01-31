//
//  TUIBookingFormViewController.m
//  Radar
//
//  Created by jmartin on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBookingFormViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
//Controller
#import "TUIBookingFormViewDataSource.h"
#import "TUIBookingFormDelegate.h"

@interface TUIBookingFormViewController ()

@property (weak, nonatomic) IBOutlet UITableView *bookingFormView;

@property (nonatomic, strong) TUIBookingFormViewDataSource *bookingFormDataSource;
@property (nonatomic, strong) TUIBookingFormDelegate *bookingFormDelegate;

@end

@implementation TUIBookingFormViewController


#pragma mark - Data

- (void)initData
{
    [super initData];
    
    NSArray *array =[self getFormField];
    
    self.bookingFormDataSource = [[TUIBookingFormViewDataSource alloc] initWithArray:array];
    self.bookingFormDelegate = [[TUIBookingFormDelegate alloc] init];
    
    self.bookingFormView.dataSource = self.bookingFormDataSource;
    self.bookingFormView.delegate = self.bookingFormDelegate;
}


#pragma mark - User interface

- (void)initUserInterface
{
    [super initUserInterface];
    
}


-(NSArray *)getFormField{
    NSMutableArray *formulario = [[NSMutableArray alloc] init];
    
    NSDictionary *name = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"Name", @"label",
                          @"UIKeyboardTypeAlphabet", @"typeCell",
                          @"John Doe", @"placeholder",
                          nil];
    
    NSDictionary *surname = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"Surname", @"label",
                          @"UIKeyboardTypeAlphabet", @"typeCell",
                          @"Martin", @"placeholder",
                          nil];
    
    NSDictionary *numberAdults = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"Number of adults", @"label",
                                  @"UIKeyboardTypeNumberPad", @"typeCell",
                                  @"0", @"placeholder",
                                  nil];
    
    NSDictionary *numberChildrens = [[NSDictionary alloc] initWithObjectsAndKeys:
                                     @"Number of children", @"label",
                                     @"UIKeyboardTypeNumberPad", @"typeCell",
                                     @"0", @"placeholder",
                                     nil];
    
    NSDictionary *cardNumber = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"Card Number", @"label",
                                @"UIKeyboardTypeNumberPad", @"typeCell",
                                @"XXXX-XXXX-XXXX-XXXX", @"placeholder",
                                nil];
    
    NSDictionary *expiryDate = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"Expiry date", @"label",
                                @"UIKeyboardTypeNumberPad", @"typeCell",
                                @"MM/YYYY", @"placeholder",
                                nil];
    
    NSDictionary *cvv = [[NSDictionary alloc] initWithObjectsAndKeys:
                         @"Cvv", @"label",
                         @"UIKeyboardTypeNumberPad", @"typeCell",
                         @"XXX", @"placeholder",
                         nil];
    
    NSDictionary *hotelVoucher = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"Hotel voucher", @"label",
                                  @"UIKeyboardTypeAlphabet", @"typeCell",
                                  @"XX", @"placeholder",
                                  nil];
    
    [formulario addObject:name];
    [formulario addObject:surname];
    [formulario addObject:numberAdults];
    [formulario addObject:numberChildrens];
    [formulario addObject:cardNumber];
    [formulario addObject:expiryDate];
    [formulario addObject:cvv];
    [formulario addObject:hotelVoucher];
    
    return formulario;
}

@end
