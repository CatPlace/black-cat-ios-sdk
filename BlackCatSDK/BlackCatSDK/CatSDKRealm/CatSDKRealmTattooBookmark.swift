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

    /**
     새로운 TattooBookmark를 Realm에 저장합니다.
     - Note: 디버그 모드로 실패 로그를 확인할 수 있습니다.
     - returns: 성공적으로 저장되었으면 true를, 저장에 실패하였으면 false를 반환합니다.
     */
    public static func create(with object: TattooBookmark) -> Bool {
        return realmService.create(with: object)
    }


    /// Realm에 저장된 모든 TattooBookmark들을 불러옵니다.
    public static func readAll() -> [TattooBookmark] {
        return realmService.readAll()
    }


    /// 해당 PrimaryKey와 똑같은 PrimaryKey를 가진 TattooBookmark를 반환합니다.
    /// 없다면 nil을 반환합니다.
    public static func find(byPrimaryKey key: String) -> TattooBookmark? {
        return realmService.find(byPrimarykey: key)
    }

    /**
     입력한 조건식에 부합하는 결과값을 반환하는 함수입니다.

     - Note: 반드시 `@Persistable` 준수하는 프로퍼티에서만 사용이 가능합니다.
     - Note: 이 함수를 사용하려면 반드시 RealmSwift를 import 해야됩니다.

     - Usage:
     ```
     tattoBookmark.find {
        $0.tattooId.contains("abcd")
     }
     ```

     - parameter query: object를 필터링 하는데 사용하는 클로저입니다.
     */
    public static func find(where query: ((Query<TattooBookmark>) -> Query<Bool>)) -> [TattooBookmark] {
        return realmService.find(where: query)
    }

    /**
     수정된 TattooBookmark를 Realm에 업데이트 합니다.

     - Note: 기존 TattooBookmark와 수정할 TattooBookmark의 PrimaryKey가 반드시 같아야합니다.
     같지 않다면 업데이트 되지 않고, false를 반환합니다.
     - returns: 성공적으로 업데이트 되었으면 true를, 업데이트에 실패하였으면 false를 반환합니다.
     */
    public static func update(with object: TattooBookmark) -> Bool {
        return realmService.update(with: object)
    }


    /**
     Realm에서 해당 TattooBookmark를 삭제합니다.

     - returns: 성공적으로 삭제되었으면 true, 삭제에 실패하였으면 false를 반환합니다.
     */
    public static func delete(_ object: TattooBookmark) -> Bool {
        return realmService.delete(object)
    }

    /**
     해당 PrimaryKey를 가진 TattooBookmark를 찾아 삭제합니다.

     - Note: Realm에 반드시 해당 PrimaryKey를 가진 TattooBookmark가 존재해야합니다. 없다면 false를 반환합니다.
     - returns: 성공적으로 삭제되었으면 true, 삭제에 실패하였으면 false를 반환합니다.
     */
    public static func delete(byPrimaryKey key: String) -> Bool {
        return realmService.delete(byPrimarykey: key)
    }

    /**
     Realm에 저장되어있는 모든 TattooBookmark들을 삭제합니다.
     - returns: 성공적으로 삭제되었으면 true, 삭제에 실패하였으면 false를 반환합니다.
     */
    public static func deleteAll() -> Bool {
        return realmService.deleteAll()
    }
}

// CatSDKRealmTattooBookmark.rx를 사용할 수 있게 해주는 프로토콜입니다.
extension CatSDKRealmTattooBookmark: ReactiveCompatible {}

public extension Reactive where Base: CatSDKRealmTattooBookmark {
    static func create(with object: TattooBookmark) -> Observable<Bool> {
        return Observable.just(Base.update(with: object))
    }

    static func readAll() -> Observable<[TattooBookmark]> {
        return Observable.just(Base.readAll())
    }

    static func find(byPrimaryKey key: String) -> Observable<TattooBookmark?> {
        return Observable.just(Base.find(byPrimaryKey: key))
    }

    static func find(where query: ((Query<TattooBookmark>) -> Query<Bool>)) -> Observable<[TattooBookmark]> {
        return Observable.just(Base.find(where: query))
    }

    static func update(with object: TattooBookmark) -> Observable<Bool> {
        return Observable.just(Base.update(with: object))
    }

    static func delete(_ object: TattooBookmark) -> Observable<Bool> {
        return Observable.just(Base.delete(object))
    }

    static func delete(byPrimaryKey key: String) -> Observable<Bool> {
        return Observable.just(Base.delete(byPrimaryKey: key))
    }

    static func deleteAll() -> Observable<Bool> {
        return Observable.just(Base.deleteAll())
    }
}
