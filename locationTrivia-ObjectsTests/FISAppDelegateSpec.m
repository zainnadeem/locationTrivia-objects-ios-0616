//  FISAppDelegateSpec.m

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import <EXPMatchers+equalInAnyOrder.h>
#import "FISAppDelegate.h"
#import "FISLocation.h"


SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    
    __block FISAppDelegate *appDelegate;
    __block FISLocation *empireState;
    __block FISLocation *flatiron;
    __block FISLocation *ladyLiberty;
    
    beforeEach(^{
        empireState = [[FISLocation alloc] initWithName:@"Empire State Building"
                                               latitude:40.748729
                                              longitude:-73.985779  ];

        flatiron = [[FISLocation alloc] initWithName:@"Flatiron School"
                                            latitude:40.705545
                                           longitude:-74.013975];

        ladyLiberty = [[FISLocation alloc] initWithName:@"Statue of Liberty"
                                               latitude:40.689481
                                              longitude:-74.044441];

        appDelegate = [[FISAppDelegate alloc] init];
        appDelegate.locations = [[NSMutableArray alloc] initWithObjects:empireState, flatiron, ladyLiberty, nil];
    });

    describe(@"allLocationNames", ^{
        it(@"should return an array containing all of the location names in the 'locations' array", ^{
            NSArray *allLocationNames = [appDelegate allLocationNames];
            NSArray *expectedNames = @[empireState.name, flatiron.name, ladyLiberty.name];
            expect(allLocationNames).to.equal(expectedNames);
        });
    });

    describe(@"locationNamed:", ^{
        it(@"should return a FISLocation object with the correct name", ^{
            FISLocation *location = [appDelegate locationNamed:flatiron.name];
            FISLocation *location2 = [appDelegate locationNamed:ladyLiberty.name];
            
            expect(location).to.equal(flatiron);
            expect(location2).to.equal(ladyLiberty);
        });

        it(@"should return 'nil' if no location with the submitted name is found", ^{
            FISLocation *location = [appDelegate locationNamed:@"Atlantis"];
            expect(location).to.beNil();
       });
    });
    
    describe(@"locationsNearLatitude:longitude:margin:", ^{
        it(@"should return an array with just flatiron when its coordinates are submitted with zero margin", ^{
            NSArray *locations = [appDelegate locationsNearLatitude:40.705545
                                                          longitude:-74.013975
                                                             margin:0.0];
            expect(locations).to.equal(@[flatiron]);
        });
        
        it(@"should return an array with flatiron and ladyLiberty when the coordinates are submitted with 0.02 margin" , ^{
            NSArray *locations = [appDelegate locationsNearLatitude:40.705545
                                                          longitude:-74.013975
                                                             margin:0.035];
            
            expect(locations).to.equalInAnyOrder(@[flatiron, ladyLiberty]);
        });
        
        it(@"should return an array with flatiron, ladyLiberty, and empireState when the coordinates are submitted with 0.05 margin" , ^{
            NSArray *locations = [appDelegate locationsNearLatitude:40.705545
                                                          longitude:-74.013975
                                                             margin:0.05];
            expect(locations).to.equalInAnyOrder(@[flatiron, ladyLiberty, empireState]);
        });
    });
});

SpecEnd
