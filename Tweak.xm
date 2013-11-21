
@interface UIDevice (Private)
- (id)uniqueIdentifier;
// <= 6.x
- (id)deviceInfoForKey:(CFStringRef)key;
// >= 7.0
- (id)_deviceInfoForKey:(CFStringRef)key;
@end


%hook UIDevice

- (NSString *)uniqueIdentifier {
	if (self == [UIDevice currentDevice] && [self respondsToSelector:@selector(_deviceInfoForKey:)]) {
		return [self _deviceInfoForKey:CFSTR("UniqueDeviceID")];
	}
	
	return %orig;
}

%end
