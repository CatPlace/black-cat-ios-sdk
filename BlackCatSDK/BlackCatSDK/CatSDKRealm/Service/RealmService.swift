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
    private let realm: Realm

    init() {
        self.realm = try! Realm()
    }

    func create(with object: T) -> Bool {
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

    func find(byPrimarykey key: String) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: key)
    }

    func find(where query: ((Query<T>) -> Query<Bool>)) -> [T] {
        return Array(realm.objects(T.self).where(query))
    }

    func update(with object: T) -> Bool {
        guard let primaryKey = T.primaryKey(),
              let object = find(byPrimarykey: primaryKey) else {
            #if DEBUG
            print("해당 PrimaryKey를 가진 Object를 찾을 수 없습니다.")
            #endif
            return false
        }

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

    func delete(_ object: T) -> Bool {
        do {
            try realm.write {
                realm.delete(object)
            }
            return true
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            return false
        }
    }

    func delete(byPrimarykey key: String) -> Bool {
        guard let object = find(byPrimarykey: key) else {
            #if DEBUG
            print("해당 PrimaryKey를 가진 Object를 찾을 수 없습니다.")
            #endif
            return false
        }

        do {
            try realm.write {
                realm.delete(object)
            }
            return true
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            return false
        }
    }

    func deleteAll() -> Bool {
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
