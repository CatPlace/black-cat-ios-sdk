//
//  CatSDKRealmTattooBookmark.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/13.
//

import Foundation

import RealmSwift
import RxCocoa
import RxSwift

public class CatSDKRealmMock {
    private init() {}

    private static let realmService = RealmService<MockRealmModel>()

    public static func create(with model: MockRealmModel) {
        return realmService.create(with: model)
    }

    public static func readAll() -> [MockRealmModel] {
        return realmService.readAll()
    }

    public static func delete(_ model: MockRealmModel) {
        return realmService.delete(model)
    }
}
