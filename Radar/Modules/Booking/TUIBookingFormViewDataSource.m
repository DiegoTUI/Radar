//
//  TUIBookingFormViewDataSource.m
//  Radar
//
//  Created by jmartin on 28/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBookingFormViewDataSource.h"

@interface TUIBookingFormViewDataSource ()

@property (nonatomic, copy) NSArray *array;

@end


@implementation TUIBookingFormViewDataSource


- (instancetype)initWithArray:(NSArray *)array
{
    if (!(self = [super init])) return nil;
    
    _array = [array copy];
    
    return self;
}
    
#pragma mark - UITableViewDataSource delegate -


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *campo = self.array[indexPath.row];
    
    float lateralMargin = 10.0f;
    float heightCell = 44.0f;
    float halfScreen = SCREEN_WIDTH/TWO_FLOAT;
    
    CGRect labelFrame = CGRectMake(lateralMargin, ZERO_FLOAT, halfScreen , heightCell);
    CGRect textFieldFrame = CGRectMake(halfScreen, ZERO_FLOAT, halfScreen - lateralMargin, heightCell);
    UIFont  *formFont = [UIFont fontWithName:LIGHT_FONT size:MENU_OPTIONS_FONT_SIZE];
    
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    label.font = formFont;
    
    UITextField *entrada = [[UITextField alloc] initWithFrame:textFieldFrame];
    entrada.keyboardType = UIKeyboardTypeDecimalPad;
    entrada.placeholder = [campo objectForKey:@"placeholder"];
    entrada.textAlignment = NSTextAlignmentRight;
    entrada.font = formFont;
    entrada.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    entrada.keyboardType = (UIKeyboardType) [campo objectForKey:@"typeCell"];


    cell.selected = NO;
    [cell.contentView addSubview:label];
    [cell.contentView addSubview:entrada];
    label.text = [campo objectForKey:@"label"];
    
    return cell;
}

@end
