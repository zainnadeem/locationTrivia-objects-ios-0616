//
//  FISTriviaSpec.m
//  locationTrivia-Objects
//
//  Created by Joe Burgess on 5/15/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#import "FISTrivia.h"
#define EXP_SHORTHAND
#import <Expecta.h>


SpecBegin(FISTrivia)

describe(@"FISTrivia", ^{

    __block FISTrivia *trivia;
    beforeAll(^{
    });
    
    beforeEach(^{
        trivia = [[FISTrivia alloc] init];
    });

    describe(@"properties", ^{
        it(@"should have a content NSString property", ^{
            expect(trivia).to.respondTo(@selector(content));
            expect(trivia).to.respondTo(@selector(setContent:));

            trivia.content = @"ASDF";
            expect(trivia.content).to.beKindOf([NSString class]);
            expect(trivia.content).to.equal(@"ASDF");
        });

        it(@"should have a likes NSInteger property", ^{
            expect(trivia).to.respondTo(@selector(likes));
            expect(trivia).to.respondTo(@selector(setLikes:));

            trivia.likes=5;
            expect(trivia.likes).to.equal(5);
        });
    });

    describe(@"init method", ^{
        it(@"should init content to blank string", ^{
            expect(trivia.content).to.equal(@"");
        });

        it(@"should init likes to 0", ^{
            expect(trivia.likes).to.equal(0);
        });
    });

    describe(@"initWithContent:Likes: method", ^{

        __block FISTrivia *initTrivia;
        beforeAll(^{
            initTrivia = [[FISTrivia alloc] initWithContent:@"Joe is amazing" Likes:5];
        });

        it(@"Should have an initWithContent:Likes method", ^{
            expect(trivia).to.respondTo(@selector(initWithContent:Likes:));
        });

        it(@"Should initialize content correctly", ^{
            expect(initTrivia.content).to.equal(@"Joe is amazing");
        });

        it(@"Should initialize likes correctly", ^{
            expect(initTrivia.likes).to.equal(5);
        });

    });


    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
