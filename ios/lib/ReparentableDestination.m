#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>

// @interface RCT_EXTERN_MODULE(RCTPortalDestination, RCTViewManager)
@interface RCTPortalDestinationManager : RCTViewManager
@end

@implementation RCTPortalDestinationManager

RCT_EXPORT_MODULE(RCTPortalDestination)

RCT_EXPORT_VIEW_PROPERTY(name, NSString)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end

