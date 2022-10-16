//
//  RealmServiceTests.swift
//  BlackCatSDKTests
//
//  Created by SeYeong on 2022/10/16.
//

import XCTest
@testable import BlackCatSDK

final class RealmServiceTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    // test_<테스트대상>_<어떤동작>_<조건?>
    func test_RealmService_create() {

        // Given
        let sut = RealmService<MockRealmModel2>()
        let mockModel = MockRealmModel2(content: "Test1")

        // When
        sut.create(with: mockModel)
        let first = sut.readAll()

        // Then
        XCTAssertEqual(first[0].content, "Test1")
    }

    func test_RealmService_delete() {
        
    }
}
