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
        let sut = RealmService<MockRealmModel>()

        let mockModel = MockRealmModel(content: "CreateTest")

        sut.deleteAll()

        // When
        sut.create(with: mockModel)
        let first = sut.readAll()

        // Then
        XCTAssertEqual(first[0].content, "CreateTest")
    }

    func test_RealmService_readAll() {
        // Given
        let sut = RealmService<MockRealmModel>()

        sut.deleteAll()

        // When
        let willEmptyResult = sut.readAll()

        // Then
        XCTAssertEqual(willEmptyResult.count, 0)
    }

    func test_RealmService_delete() {

        // Given
        let sut = RealmService<MockRealmModel>()

        let mockModel1 = MockRealmModel(content: "DeleteTest1")
        let mockModel2 = MockRealmModel(content: "DeleteTest2")
        let mockModel3 = MockRealmModel(content: "DeleteTest3")

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

    func test_RealmService_updateByPrimaryKey() {

        // Given
        let sut = RealmService<MockRealmModel>()

        let oldModel = MockRealmModel(content: "UpdateOldItem")
        let newModel = MockRealmModel()
        newModel.id = oldModel.id
        newModel.content = "UpdateNewItem"

        sut.deleteAll()
        sut.create(with: oldModel)

        // When
        sut.update(with: newModel)
        let result = sut.readAll()

        // Then
        XCTAssertEqual(result.map { $0.content }, ["UpdateNewItem"])
    }

    func test_RealmService_findByPrimaryKey() {

        // Given
        let sut = RealmService<MockRealmModel>()

        let model = MockRealmModel(content: "TargetModel")
        let primaryKey = model.id
        let failedKey = UUID().uuidString

        sut.deleteAll()
        sut.create(with: model)

        // When
        let successResult = sut.findByPrimaryKey(primaryKey)
        let nilResult = sut.findByPrimaryKey(failedKey)

        // Then
        XCTAssertEqual(successResult?.content, "TargetModel")
        XCTAssertNil(nilResult)
    }

    func test_RealmService_find() {
        let sut = RealmService<MockRealmModel>()

        let model1 = MockRealmModel(content: "FindModel1")
        let model2 = MockRealmModel(content: "FindModel2")
        let model3 = MockRealmModel(content: "FindModel3")

        sut.deleteAll()
        sut.create(with: model1)
        sut.create(with: model2)
        sut.create(with: model3)

        // When
        let result = sut.find { $0.content.contains("asldfkjsadkf") }

        // Then
        XCTAssertEqual(result.count, 0)
    }
}
