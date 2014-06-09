//
//  FISLocationSpec.m
//  locationTrivia-Objects
//
//  Created by Joe Burgess on 5/15/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISLocation.h"
#define MOCKITO_SHORTHAND
#import <OCMockito.h>


SpecBegin(FISLocation)

describe(@"FISLocation", ^{

    __block FISLocation *location;
    beforeAll(^{
        location = [[FISLocation alloc] init];
    });
    
    describe(@"Properties", ^{
        it(@"Should have a name property", ^{
            expect(location).to.respondTo(@selector(name));
            expect(location).to.respondTo(@selector(setName:));

            location.name=@"Da Name";
            expect(location.name).to.beKindOf([NSString class]);
            expect(location.name).to.equal(@"Da Name");
        });

        it(@"Should have a latitude property", ^{
            expect(location).to.respondTo(@selector(latitude));
            expect(location).to.respondTo(@selector(setLatitude:));

            location.latitude=@4;
            expect(location.latitude).to.beKindOf([NSNumber class]);
            expect(location.latitude).to.equal(@4);
        });

        it(@"Should have a longitude property", ^{
            expect(location).to.respondTo(@selector(longitude));
            expect(location).to.respondTo(@selector(setLongitude:));

            location.longitude=@5;
            expect(location.longitude).to.beKindOf([NSNumber class]);
            expect(location.longitude).to.equal(@5);
        });

    });

    describe(@"verifyLocation", ^{
        it(@"Should respond to the verifyLocation method", ^{
            expect(location).to.respondTo(@selector(verifyLocation));
        });

        it(@"Should return YES for a valid location", ^{
            FISLocation *loc = [[FISLocation alloc] initWithName:@"Empire State Building" Latitude:@40.7484 Longitude:@-73.9857];
            expect(loc.verifyLocation).to.beTruthy();
        });

        it(@"Should return YES for a valid location", ^{
            FISLocation *loc = [[FISLocation alloc] initWithName:@"Empire State Building" Latitude:@40.7484 Longitude:@-73.9857];
            expect(loc.verifyLocation).to.beTruthy();
        });

        it(@"Should return NO for invalid latitude", ^{
            FISLocation *loc = [[FISLocation alloc] initWithName:@"Empire State Building" Latitude:@140.7484 Longitude:@-73.9857];
            expect(loc.verifyLocation).to.beFalsy();
        });

        it(@"Should return NO for invalid longitude", ^{
            FISLocation *loc = [[FISLocation alloc] initWithName:@"Empire State Building" Latitude:@40.7484 Longitude:@-1173.9857];
            expect(loc.verifyLocation).to.beFalsy();
        });

        it(@"Should return NO for invalid name", ^{
            FISLocation *loc = [[FISLocation alloc] initWithName:@"" Latitude:@40.7484 Longitude:@-1173.9857];
            expect(loc.verifyLocation).to.beFalsy();
        });
    });

    describe(@"Shorten Location Name", ^{
        it(@"Should have a method called shortenLocationNameToLength:", ^{
            expect(location).to.respondTo(@selector(shortenedNameToLength:));
        });
        
        it(@"Should return an NSString", ^{
            expect([location shortenedNameToLength:5]).to.beKindOf([NSString class]);
        });
        
        it(@"Should shorten Location Name to 5 characters", ^{
            NSString *shortenedName =[location shortenedNameToLength:5];
            expect([shortenedName length]).to.equal(5);
        });
        
        it(@"Should handle negative numbers by returning the same string", ^{
            NSString *shortenedName =[location shortenedNameToLength:-5];
            expect(shortenedName).to.equal(location.name);
        });
    });

});

SpecEnd
