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
    typealias didSuccess = Bool
    private let realm: Realm

    init() {
        self.realm = try! Realm()
    }

    func create(with object: T) -> didSuccess {
        do {
            try realm.write {
                realm.add(object)
            }
            return true
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            return false
        }
    }

    func readAll() -> [T] {
        return Array(realm.objects(T.self))
    }

    func findByPrimaryKey(_ identifier: String) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: identifier)
    }

    func find(where query: ((Query<T>) -> Query<Bool>)) -> [T] {
        return Array(realm.objects(T.self).where(query))
    }

    func update(with object: T) -> didSuccess {
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
            return true
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            return false
        }
    }

    func delete(_ model: T) -> didSuccess {
        do {
            try realm.write {
                realm.delete(model)
            }
            return true
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            return false
        }
    }

    func deleteByPrimaryKey(_ primaryKey: String) -> didSuccess {
        if let object = findByPrimaryKey(primaryKey) {
            realm.delete(object)
            return true
        } else {
            return false
        }
    }

    func deleteAll() -> didSuccess {
        let result = readAll()
        do {
            try realm.write {
                realm.delete(result)
            }
            return true
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            return false
        }
    }
}
