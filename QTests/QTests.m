//
//  QTests.m
//  QTests
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface QTests : XCTestCase

@end

@implementation QTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
