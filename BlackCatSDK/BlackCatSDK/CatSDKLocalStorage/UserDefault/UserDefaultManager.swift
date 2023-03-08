//
//  UserDefaultManager.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/12/26.
//


import Foundation
import RxSwift
import RxCocoa
import RxRelay

public struct UserDefaultManager {
    static let userImageUrlString = PublishRelay<String?>()
    static let userIdRelay = PublishRelay<Int>()
    /// -1: 둘러보기, -2: 로그인 하지 않은 상태
    @UserDefault(key: "user", defaultValue: Model.User(id: -2))
    private static var user: Model.User {
        didSet {
            userImageUrlString.accept(user.imageUrl)
            userIdRelay.accept(user.id)
        }
    }

    @UserDefault(key: "bookmarkedTattoo", defaultValue: [])
    public static var bookmarkedTattoo: [Model.Tattoo]
    
    @UserDefault(key: "recentViewTattoos", defaultValue: [])
    private static var recentViewTattoos: [Model.Tattoo]
    
    @UserDefault(key: "tattooistProfileCache", defaultValue: .init())
    private static var tattooistInfo: Model.TattooistInfo
}

@propertyWrapper
public struct UserDefault<T: Codable> {
    private let key: String
    private let defaultValue: T
    public let storage: UserDefaults

    init(key: String, defaultValue: T, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public var wrappedValue: T {
        get {
            guard let data = self.storage.object(forKey: key) as? Data else {
                return defaultValue
            }

            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)

            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

// User
extension UserDefaultManager {
    public static func getUser() -> Model.User {
        UserDefaultManager.user
    }
    public static func updateUser(user: Model.User) {
        UserDefaultManager.user = user
    }
    
    public static func imageUrlStringObservable() -> Observable<String?> {
        return userImageUrlString.distinctUntilChanged()
    }
    
    public static func userIdObservable() -> Observable<Int> {
        return userIdRelay.distinctUntilChanged()
    }
}

// recentTattoo
extension UserDefaultManager {
    public static func getRecentTattoos() -> [Model.Tattoo] {
        UserDefaultManager.recentViewTattoos
    }
    public static func updateRecentTattoos(tattoos: [Model.Tattoo]) {
        UserDefaultManager.recentViewTattoos = tattoos
    }
}

//tattooistInfo
extension UserDefaultManager {
    public static func getTattooistInfo() -> Model.TattooistInfo {
        UserDefaultManager.tattooistInfo
    }
    public static func updateTattooistInfo(tattooistInfo: Model.TattooistInfo) {
        UserDefaultManager.tattooistInfo = tattooistInfo
    }
}
