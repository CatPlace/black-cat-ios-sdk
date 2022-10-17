//
//  MockModel.swift
//  BlackCatSDKTests
//
//  Created by SeYeong on 2022/10/16.
//

import Foundation

import RealmSwift

class MockRealmModel: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var createdAt: Date = Date()
    @Persisted var content: String

    convenience init(content: String) {
        self.init()

        self.content = content
    }
}
