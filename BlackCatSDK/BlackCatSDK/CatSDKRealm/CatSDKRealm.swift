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

    public func create(with object: T) throws {
        do{
            try realmService.create(with: object)
        } catch let error {
            throw error
        }
    }

    public func readAll() -> [T] {
        return realmService.readAll()
    }

    public func find(byPrimaryKey key: String) -> T? {
        return realmService.find(byPrimaryKey: key)
    }

    public func find(where query: ((Query<T>) -> Query<Bool>)) -> [T] {
        return realmService.find(where: query)
    }

    public func update(with object: T) throws {
        do {
            try realmService.update(with: object)
        } catch let error {
            throw error
        }
    }

    public func delete(_ object: T) throws {
        do {
            try realmService.delete(object)
        } catch let error {
            throw error
        }
    }

    public func delete(byPrimaryKey key: String) throws {
        do {
            try realmService.delete(byPrimarykey: key)
        } catch let error {
            throw error
        }
    }

    public func deleteAll() throws {
        do {
            try realmService.deleteAll()
        } catch let error {
            throw error
        }
    }
}

extension CatSDKRealm: ReactiveCompatible {}

public extension Reactive where Base: CatSDKRealmProvider {
    func create(with object: Base.T) -> Observable<Void> {
        return Observable.create { observer in
            do {
                try base.create(with: object)
                observer.onNext(())
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func readAll() -> Observable<[Base.T]> {
        return Observable.just(base.readAll())
    }

    func find(byPrimaryKey key: String) -> Observable<Base.T?> {
        return Observable.just(base.find(byPrimaryKey: key))
    }

    func find(where query: ((Query<Base.T>) -> Query<Bool>)) -> Observable<[Base.T]> {
        return Observable.just(base.find(where: query))
    }

    func update(with object: Base.T) -> Observable<Void> {
        return Observable.create { observer in
            do {
                try base.update(with: object)
                observer.onNext(())
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func delete(_ object: Base.T) -> Observable<Void> {
        return Observable.create { observer in
            do {
                try base.delete(object)
                observer.onNext(())
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func delete(byPrimaryKey key: String) -> Observable<Void> {
        return Observable.create { observer in
            do {
                try base.delete(byPrimaryKey: key)
                observer.onNext(())
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func deleteAll() -> Observable<Void> {
        return Observable.create { observer in
            do {
                try base.deleteAll()
                observer.onNext(())
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
}

