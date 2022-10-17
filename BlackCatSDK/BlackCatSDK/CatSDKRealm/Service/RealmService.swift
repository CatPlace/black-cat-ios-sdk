//
//  RealmService.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/14.
//

import Foundation

import RealmSwift
import RxSwift

final class RealmService<ObjectType: Object> {
    private var realm: Realm {
        do {
            return try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        return self.realm
    }

    func create(with model: ObjectType) {
        try! realm.write {
            realm.add(model)
        }
    }

    func readAll() -> [ObjectType] {
        return Array(realm.objects(ObjectType.self))
    }

    func findByPrimaryKey(_ identifier: String) -> ObjectType? {
        return realm.object(ofType: ObjectType.self, forPrimaryKey: identifier)
    }

    func findBy(primaryKey: String) -> ObjectType? {
        return realm.object(ofType: ObjectType.self, forPrimaryKey: primaryKey)
    }

    func find(where query: ((Query<ObjectType>) -> Query<Bool>)) -> [ObjectType] {
        return Array(realm.objects(ObjectType.self).where(query))
    }

    func updateByPrimaryKey(_ newItem: ObjectType) {
        try! realm.write {
            realm.add(newItem, update: .modified)
        }
    }

    func delete(_ model: ObjectType) {
        try! realm.write {
            realm.delete(model)
        }
    }

    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
