//
//  CatSDKRealm.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/18.
//

import Foundation

import RealmSwift
import RxSwift

public protocol CatSDKRealmProvider {
    associatedtype T: Object

    func create(with object: T) throws
    func readAll() -> [T]
    func find(byPrimaryKey key: String) -> T?
    func find(where query: ((Query<T>) -> Query<Bool>)) -> [T]
    func update(with object: T) throws
    func delete(_ object: T) throws
    func delete(byPrimaryKey key: String) throws
    func deleteAll() throws
}

public class CatSDKRealm<T: Object>: CatSDKRealmProvider {
    private let realmService: RealmService = RealmService<T>()

    public init() {}

    /**
     입력한 RealmModel을 Realm에 저장합니다.

     저장에 실패하였으면 Error를 던집니다.

     - Parameter object: Realm에 저장할 Object타입의 모델
     - Throws: 저장에 실패하였을 때 던지는 `NSError`
     */
    public func create(with object: T) throws {
        do{
            try realmService.create(with: object)
        } catch let error {
            throw error
        }
    }

    /// Realm에 저장된 해당 object들을 불러옵니다.
    public func readAll() -> [T] {
        return realmService.readAll()
    }

    /**
     입력된 PrimaryKey와 똑같은 PrimaryKey를 가진 TattooBookmark를 반환합니다. 없다면 nil을 반환합니다.

     - Parameter key: object가 가지고 있는 고유 키 값
     - Returns: 해당 PrimaryKey를 가지고 있는 object, 없다면 nil
     */
    public func find(byPrimaryKey key: String) -> T? {
        return realmService.find(byPrimaryKey: key)
    }

    /**
     입력된 조건식에 부합하는 결과값을 반환하는 함수입니다.

     - Warning: 반드시 `@Persistable`을 준수하는 프로퍼티에서만 사용이 가능합니다.
     - Note: 이 함수를 사용하려면 반드시 RealmSwift를 import 해야합니다.


     ```
     CatSDKRealm<ModelA>().find {
        $0.id.contains("abcd")
     }
     ```

     - Parameter query: object를 필터링 하는데 사용하는 클로져
     - Returns: 필터링 된 object들이 담긴 Array
     */
    public func find(where query: ((Query<T>) -> Query<Bool>)) -> [T] {
        return realmService.find(where: query)
    }

    /**
     입력된 object와 같은 PrimaryKey를 가진 object를 찾아 수정합니다.

     - Note: 기존 object와 수정할 object의 PrimaryKey가 반드시 같아야합니다. 같지 않다면 수정되지 않고 error를 던집니다.
     - Throws: 수정에 실패하였을 때 던지는 `NSError`
     */
    public func update(with object: T) throws {
        do {
            try realmService.update(with: object)
        } catch let error {
            throw error
        }
    }

    /**
     Realm에서 입력된 object를 찾아 삭제합니다.

     - Throws: 삭제에 실패했을 때 던지는 `NSError`
     */
    public func delete(_ object: T) throws {
        do {
            try realmService.delete(object)
        } catch let error {
            throw error
        }
    }

    /**
     입력된 Primary Key와 동일한 PrimaryKey를 가지는 Object를 찾아 realm에서 삭제합니다. 동일한 PirmaryKey를 가진 Object가 없다면 error를 던집니다.

     - Throws: 삭제에 실패했을 때 던지는 `NSError`
     */
    public func delete(byPrimaryKey key: String) throws {
        do {
            try realmService.delete(byPrimarykey: key)
        } catch let error {
            throw error
        }
    }

    /**
     Generic으로 선언된 모든 Object들을 Realm에서 삭제합니다.

     - Throws: 삭제에 실패했을 때 던지는 `NSError`
     */
    public func deleteAll() throws {
        do {
            try realmService.deleteAll()
        } catch let error {
            throw error
        }
    }
}
