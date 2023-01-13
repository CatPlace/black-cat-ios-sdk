//
//  CatSDKTattoo.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/01/05.
//

import Foundation

public class CatSDKTattoo {
    public static func updateRecentViewTattoos(tattoo: Model.Tattoo) {
        var tattoos = UserDefaultManager.getRecentTattoos()
        if let index = tattoos.firstIndex(where: {
            $0.id == tattoo.id
        }) {
            tattoos.remove(at: index)
        }
        tattoos.insert(tattoo, at: 0)
        UserDefaultManager.updateRecentTattoos(tattoos: tattoos)
    }
    public static func recentViewTattoos() -> [Model.Tattoo] {
        print(UserDefaultManager.getRecentTattoos())
        return UserDefaultManager.getRecentTattoos()
    }
}
