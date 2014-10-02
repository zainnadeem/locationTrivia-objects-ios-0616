//
//  FISAppDelegateSpec.m
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/14/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISAppDelegate.h"
#import "FISLocation.h"
#define MOCKITO_SHORTHAND
#import <OCMockito.h>

SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    __block FISAppDelegate *appDelegate;
    __block FISLocation *location;
    __block FISLocation *location2;
    __block FISLocation *location3;
    __block NSArray *locationsArray;
    beforeAll(^{
        appDelegate = [[FISAppDelegate alloc] init];

        location = [[FISLocation alloc] init];
        location.name = @"The Empire State Building";
        location.latitude = @34.23;
        location.longitude = @-43.32;

        location2 = [[FISLocation alloc] init];
        location2.name = @"The Flatiron School";
        location2.latitude = @33.23;
        location2.longitude = @-23.32;

        location3 = [[FISLocation alloc] init];
        location3.name = @"Statue of Liberty";
        location3.latitude = @13.23;
        location3.longitude = @-13.32;

        locationsArray = @[location, location2, location3];

    });
    
    beforeEach(^{

    });


    describe(@"Get Location Names With Location", ^{
        it(@"Should have a method called getLocationNamesWithLocations", ^{
            expect(appDelegate).to.respondTo(@selector(getLocationNamesWithLocations:));
        });

        it(@"Should get the locations", ^{
            NSArray *locationNames = [appDelegate getLocationNamesWithLocations:locationsArray];
            expect(locationNames).to.contain(location.name);
            expect(locationNames).to.contain(location2.name);
            expect(locationNames).to.contain(location3.name);
        });

        it(@"Should return an NSArray", ^{
            expect([appDelegate getLocationNamesWithLocations:locationsArray]).to.beKindOf([NSArray class]);
        });
    });

    describe(@"Search for Location Name", ^{
        it(@"Should have a method called searchForLocationName:inLocations:", ^{
            expect(appDelegate).to.respondTo(@selector(searchForLocationName:inLocations:));
        });

        it(@"Should return a FISLocation", ^{
            expect([appDelegate searchForLocationName:@"The Flatiron School" inLocations:locationsArray]).to.beKindOf([FISLocation class]);
        });

        it(@"Should return the appropriate FISLocation Location", ^{
            FISLocation *returnedLocation = [appDelegate searchForLocationName:@"The Flatiron School" inLocations:locationsArray];
           expect(returnedLocation).to.equal(location2);
        });

        it(@"Should return nil if no location is found", ^{
           FISLocation *returnedLocation = [appDelegate searchForLocationName:@"BAD LOCATION" inLocations:locationsArray];
            expect(returnedLocation).to.beNil();
       });
    });

});

SpecEnd
