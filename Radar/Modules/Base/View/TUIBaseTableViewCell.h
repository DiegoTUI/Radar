//
//  TUIBaseTableViewCell.h
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

/**
 TUIBaseTableViewCell is a UITableViewCell base class which all table view cells should subclass from
 */
@interface TUIBaseTableViewCell : UITableViewCell

/**
 Returns the identifier for reusing this type of cell
 */
+ (NSString *)reuseIdentifier;

/**
 Returns the current height of the cell
 */
- (CGFloat)cellHeight;

@end
