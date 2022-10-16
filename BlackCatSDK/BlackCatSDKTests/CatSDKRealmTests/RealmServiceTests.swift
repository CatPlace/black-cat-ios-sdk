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

    // test_<테스트대상>_<동작>_<조건?>
    func test_RealmService_create() {

        // Given
        let sut = RealmService<MockRealmModel2>()

        let mockModel = MockRealmModel2(content: "CreateTest")

        sut.deleteAll()

        // When
        sut.create(with: mockModel)
        let first = sut.readAll()

        // Then
        XCTAssertEqual(first[0].content, "CreateTest")
    }

    func test_RealmService_delete() {

        // Given
        let sut = RealmService<MockRealmModel2>()

        let mockModel1 = MockRealmModel2(content: "DeleteTest1")
        let mockModel2 = MockRealmModel2(content: "DeleteTest2")
        let mockModel3 = MockRealmModel2(content: "DeleteTest3")

        sut.deleteAll()

        sut.create(with: mockModel1)
        sut.create(with: mockModel2)
        sut.create(with: mockModel3)

        // When
        sut.delete(mockModel2)
        let result = sut.readAll()

        // Then
        XCTAssertEqual(result.map { $0.content }, ["DeleteTest1", "DeleteTest3"])
    }

    func test_RealmService_update() {

        // Given
        let sut = RealmService<MockRealmModel2>()

        let oldModel = MockRealmModel2(content: "UpdateOldItem")
        let newModel = MockRealmModel2()
        newModel.id = oldModel.id
        newModel.content = "UpdateNewItem"

        sut.deleteAll()
        sut.create(with: oldModel)

        // When
        sut.updateByPrimaryKey(newModel)
        let result = sut.readAll()

        // Then
        XCTAssertEqual(result.map { $0.content }, ["UpdateNewItem"])
    }
}
