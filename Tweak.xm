@interface NCNotificationAction : NSObject
  @property (nonatomic,copy,readonly) NSString * identifier;                                     //@synthesize identifier=_identifier - In the implementation block
  // @property (nonatomic,copy,readonly) NSString * title;
  // @property (nonatomic,copy,readonly) NSString * launchBundleID;
  // @property (nonatomic,copy,readonly) NSURL * launchURL;
@end

%hook NCNotificationAction

  -(BOOL)requiresAuthentication
  {
    NSString *ActionIdentifier = [self identifier];
    if ([ActionIdentifier isEqualToString:@"MFMailBulletinSwipeActionTrash"])
    {
      return NO;
    }
    else
    {
      return %orig;
    }
  }

%end
