@interface MPUTransportControl : NSObject

@property NSInteger type;

@end

%hook MPUTransportControlsView

- (id)_availableTransportControlsForGroup:(int)arg1 {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (MPUTransportControl *control in %orig) {
        if (control.type != 6 && control.type != 8) {
            [array addObject:control];
        }
    }
    
    return [NSArray arrayWithArray:array];
}

%end