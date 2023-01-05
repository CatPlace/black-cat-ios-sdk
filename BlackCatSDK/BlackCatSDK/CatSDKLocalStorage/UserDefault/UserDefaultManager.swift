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
    /// -1: 둘러보기, -2: 로그인 하지 않은 상태
    @UserDefault(key: "user", defaultValue: Model.User(id: -2))
    public static var user: Model.User

    @UserDefault(key: "bookmarkedTattoo", defaultValue: [])
    public static var bookmarkedTattoo: [Model.Tattoo]
    
    @UserDefault(key: "userCache", defaultValue: Model.User(id: -2))
    public static var userCache: Model.User
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
