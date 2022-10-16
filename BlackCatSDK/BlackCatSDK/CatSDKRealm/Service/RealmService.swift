//
//  RealmService.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/14.
//

import Foundation

import RealmSwift
import RxSwift

final class RealmService<T: Object> {
    private var realm = try! Realm()

    func create(with model: T) {
        try! realm.write {
            realm.add(model)
        }
    }

    func readAll() -> [T] {
        return Array(realm.objects(T.self))
    }

    func delete(_ model: T) {
        try! realm.write {
            realm.delete(model)
        }
    }
}
