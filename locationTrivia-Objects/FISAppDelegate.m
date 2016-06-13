//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISLocation.h"
@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    return YES;
}


-(NSArray *)allLocationNames{
    NSMutableArray *mutableAllLocationNames = [[NSMutableArray alloc]init];
    for (FISLocation *location in self.locations){
        [mutableAllLocationNames addObject:location.name];
       }
    NSArray *allLocationNames = mutableAllLocationNames;
    return allLocationNames;
}

-(FISLocation *)locationNamed:(NSString*)name{
    for (FISLocation *location in self.locations){
        if ([location.name isEqualToString:name]){
            return location;
        }
    }
    return nil;
    
}
-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin{
    NSMutableArray *locationThatFallsWithinMargin = [[NSMutableArray alloc]init];
    for (FISLocation *location in self.locations){
        if  ((fabs(location.latitude) - fabs(latitude) <= margin)  &&   ((fabs(location.longitude) - fabs(longitude)) <=  margin)) {
        [locationThatFallsWithinMargin addObject:location];
        }
        
    }
    
    
    return locationThatFallsWithinMargin;
}


@end
