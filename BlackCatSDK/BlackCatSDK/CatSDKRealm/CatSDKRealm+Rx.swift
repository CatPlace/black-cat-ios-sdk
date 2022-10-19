//
//  CatSDKRealm+Rx.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/19.
//

import Foundation

import RealmSwift
import RxSwift

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

