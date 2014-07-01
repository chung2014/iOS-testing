//
//  HorizontalScroller.h
//  BlueLibrary
//
//  Created by chung2014 on 30/6/14.
//  Copyright (c) 2014 Eli Ganem. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalScrollerDelegate;

@interface HorizontalScroller : UIView

@property (weak) id<HorizontalScrollerDelegate> delegate;

- (void)reload;

@end

@protocol HorizontalScrollerDelegate <NSObject>
// methods declaration goes in here
@required
// ask the delegate how many views he wants to present inside the horizontal scroller
- (NSInteger)numberOfViewsForHorizaontalScroller:(HorizontalScroller *)scroller;

// ask the delegate to return the view that should appear at <index>
- (UIView *)horizontalScroller:(HorizontalScroller *)scroller viewAtIndex:(int)index;

// inform the delegate what the view at <index> has been clicked
- (void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index;

@optional
// ask the delegate for the index of the initial view to display. this method is optional
// and defaults to 0 if it's not implemented by the delegate
- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller;

@end
