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


SpecBegin(FISLocation)

describe(@"FISLocation", ^{

    __block FISLocation *location;
    beforeAll(^{
        location = [[FISLocation alloc] init];
    });
    
    describe(@"init", ^{
        it(@"Should return non-nil", ^{
            expect(location).toNot.beNil();
        });

        it(@"Should set name to blank string", ^{
            expect(location.name).to.equal(@"");
        });

        it(@"Should set latitude to blank 0", ^{
            expect(location.latitude).to.equal(@0);
        });

        it(@"Should set longitude to blank 0", ^{
            expect(location.longitude).to.equal(@0);
        });

        it(@"Should initalize trivia", ^{
            expect(location.trivia).toNot.beNil();
        });
    });

    describe(@"initWithName:Latitude:Longitude method", ^{
        __block FISLocation *initLocation;
        beforeAll(^{
            initLocation = [[FISLocation alloc] initWithName:@"asdf" Latitude:@23 Longitude:@-34];
        });

        it(@"Should have a method called initWithName:Latitude:Longitude", ^{
            expect(initLocation).to.respondTo(@selector(initWithName:Latitude:Longitude:));
        });

        it(@"Should return non-nil", ^{
            expect(initLocation).toNot.beNil();
        });

        it(@"Should set name to correct String", ^{
            expect(initLocation.name).to.equal(@"asdf");
        });

        it(@"Should set latitude to correct number", ^{
            expect(initLocation.latitude).to.equal(@23);
        });

        it(@"Should set longitude to blank 0", ^{
            expect(initLocation.longitude).to.equal(@-34);
        });

        it(@"Should initalize trivia", ^{
            expect(initLocation.trivia).toNot.beNil();
        });
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

        it(@"Should have a trivium property", ^{
            expect(location).to.respondTo(@selector(trivia));
            expect(location).to.respondTo(@selector(setTrivia:));

            location.trivia= [NSMutableArray arrayWithObjects:@1, nil];
            expect(location.trivia).to.beKindOf([NSMutableArray class]);
            expect(location.trivia).to.equal([NSMutableArray arrayWithObjects:@1, nil]);
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

    describe(@"topTrivia", ^{
        __block FISTrivia *triviaA;
        __block FISTrivia *triviaB;
        __block FISTrivia *triviaC;
        beforeAll(^{
            triviaA = mock([FISTrivia class]);
            triviaB = mock([FISTrivia class]);
            triviaC = mock([FISTrivia class]);

            [given([triviaA likes]) willReturnInt:5];
            [given([triviaB likes]) willReturnInt:3];
            [given([triviaC likes]) willReturnInt:1];
        });
        it(@"Should return the top Trivia", ^{
            FISLocation *locationSorter = [[FISLocation alloc] initWithName:@"Testing" Latitude:@0 Longitude:@0];
            [locationSorter.trivia addObjectsFromArray:@[triviaC, triviaA, triviaB]];

            expect(locationSorter.topTrivia).to.equal(triviaA);
        });

        it(@"Should return nil if there is no Trivia", ^{
            FISLocation *locationSorter = [[FISLocation alloc] init];

            expect([locationSorter topTrivia]).to.beNil();
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


    afterEach(^{
    });
    
    afterAll(^{

    });
});

SpecEnd
