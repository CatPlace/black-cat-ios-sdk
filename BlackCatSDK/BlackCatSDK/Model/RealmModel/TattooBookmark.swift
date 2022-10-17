//
//  RealmModelMock.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/13.
//

import Foundation

import RealmSwift

public class TattooBookmark: Object {
    @Persisted(primaryKey: true) public var id: String = UUID().uuidString
    @Persisted public var createdAt: Date = Date()
    @Persisted public var imageURLString: String
    @Persisted public var tattooId: String
    @Persisted public var categoryId: String

    public convenience init(imageURLString: String, tattooId: String, categoryId: String) {
        self.init()

        self.imageURLString = imageURLString
        self.tattooId = tattooId
        self.categoryId = categoryId
    }
}
