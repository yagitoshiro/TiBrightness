/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "OrgSelfkleptomaniacModTibrightnessModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation OrgSelfkleptomaniacModTibrightnessModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"2a3f1045-2555-4821-a62f-35a63149151e";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"org.selfkleptomaniac.mod.tibrightness";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs
-(float)setBrightness:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString *newBrightness = [TiUtils stringValue:[args objectForKey:@"brightness"]];
    CGFloat brightness = [newBrightness floatValue];
    if(brightness > 1.0f){
        brightness = 1.0f;
    }
    [[UIScreen mainScreen] setBrightness:brightness];
    return [self getBrightness:(id)args];
}

-(float)getBrightness:(id)args
{
    CGFloat brightness = [[UIScreen mainScreen] brightness];
    NSLog(@"[INFO] Brightness: %f",brightness);
    return brightness;
}

-(float)up:(id)args
{
    CGFloat brightness = [[UIScreen mainScreen] brightness];
    if(brightness < 1.0f){
        brightness += 0.1f;
        [[UIScreen mainScreen] setBrightness:brightness];
    }
    return [self getBrightness:(id)args];
}

-(float)down:(id)args
{
    CGFloat brightness = [[UIScreen mainScreen] brightness];
    if(brightness > 0.0f){
        brightness -= 0.1f;
        [[UIScreen mainScreen] setBrightness:brightness];
    }
    return [self getBrightness:(id)args];
}

@end
