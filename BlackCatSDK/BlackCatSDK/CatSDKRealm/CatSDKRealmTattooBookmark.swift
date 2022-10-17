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

public class CatSDKRealmTattooBookmark {
    private init() {}

    private static let realmService = RealmService<TattooBookmark>()

    public static func create(with model: TattooBookmark) -> Bool {
        return realmService.create(with: model)
    }

    public static func readAll() -> [TattooBookmark] {
        return realmService.readAll()
    }

//    public static func findBy(query: ((Query<TattooBookmark>) -> Query<Bool>)) -> [TattooBookmark] {
//        return realmService.findBy(query: query)
//    }

    public static func delete(_ model: TattooBookmark) {
        return realmService.delete(model)
    }

    public static func updateByPrimaryKey(_ model: TattooBookmark) {
        return realmService.updateByPrimaryKey(model)
    }
}

