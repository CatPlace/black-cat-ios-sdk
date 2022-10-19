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

    func create(with object: T) throws {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            throw error
        }
    }

    func readAll() -> [T] {
        return Array(realm.objects(T.self))
    }

    func find(byPrimaryKey key: String) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: key)
    }

    func find(where query: ((Query<T>) -> Query<Bool>)) -> [T] {
        return Array(realm.objects(T.self).where(query))
    }

    func update(with object: T) throws {
        guard let primaryKey = T.primaryKey(),
              let object = find(byPrimaryKey: primaryKey) else {
            #if DEBUG
            print("해당 PrimaryKey를 가진 Object를 찾을 수 없습니다.")
            #endif
            return
        }

        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            throw error
        }
    }

    func delete(_ object: T) throws {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            throw error
        }
    }

    func delete(byPrimarykey key: String) throws {
        guard let object = find(byPrimaryKey: key) else {
            #if DEBUG
            print("해당 PrimaryKey를 가진 Object를 찾을 수 없습니다.")
            #endif
            throw RealmError.unableToFindPrimaryKey
        }

        do {
            try realm.write {
                realm.delete(object)
            }
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            throw error
        }
    }

     func deleteAll() throws {
        let result = readAll()
        do {
            try realm.write {
                realm.delete(result)
            }
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
            throw error
        }
    }
}

enum RealmError: Error {
    case unableToFindPrimaryKey
}
