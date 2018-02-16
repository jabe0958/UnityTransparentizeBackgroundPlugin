//
//  UnityTransparentizeBackgroundPlugin.m
//  UnityTransparentizeBackgroundPlugin
//
//  Created by jabe0958 on 2018/02/09.
//  Copyright © 2018年 jabe0958. All rights reserved.
//

@import AppKit;
#import <Foundation/Foundation.h>

void TransparentizeBackground() {

    // Get the Unity App Window
    NSArray *ar = [NSApp orderedWindows];
    NSWindow *window = [ar objectAtIndex:0];
    
    // Set the Unity App Window to transparent
    [window setTitleVisibility:NSWindowTitleHidden];
    [window setTitlebarAppearsTransparent:true];
    [window setStyleMask:NSWindowStyleMaskBorderless];
    [window setBackgroundColor:[NSColor clearColor]];
    [window setOpaque:NO];
    [window setHasShadow:false];
    [window setTitle:@"window"];
    
    // Get the Unity App View
    NSView *view = [window contentView];
    
    // Set the Unity App View to transparent
    [[view layer] setBackgroundColor:CGColorCreateGenericRGB(0, 0, 0, 0)];
    [[view layer] setOpaque:NO];
    
    // Create a new Window for the Unity App View
    NSRect rect = [window contentLayoutRect];
    NSWindow *newWindow = [[NSWindow alloc] initWithContentRect:rect styleMask:NSWindowStyleMaskBorderless backing:NSBackingStoreBuffered defer:NO];
    [newWindow setTitle:@"newWindow"];
    [newWindow center];
    [newWindow setReleasedWhenClosed:YES];
    [newWindow orderFrontRegardless];
    
    // Set the created window to transparent
    [newWindow setBackgroundColor:[NSColor clearColor]];
    [newWindow setOpaque:NO];
    
    // Set the Unity App View to the created window of contentView
    [newWindow setContentView:view];

    // Reset the Unity App View to the Unity App Window of contentView
    [window setContentView:view];

    // Set the Unity App Window to get mouse events
    [window setIgnoresMouseEvents:NO];
    
    // Set the Unity view to the Unity App Window of a first responder
    [window setInitialFirstResponder:(NSView *) view];
    
    // Hide the create window
    [newWindow setAccessibilityHidden:true];
    
}

