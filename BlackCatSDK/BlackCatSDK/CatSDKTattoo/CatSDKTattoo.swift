//
//  CatSDKTattoo.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/01/05.
//

import Foundation
import RxSwift

public class CatSDKTattoo {
    public static func updateRecentViewTattoos(tattoo: Model.Tattoo) {
        var tattoos = UserDefaultManager.getRecentTattoos()
        if let index = tattoos.firstIndex(where: {
            $0.id == tattoo.id
        }) {
            tattoos.remove(at: index)
        }
        tattoos.insert(tattoo, at: 0)
        if tattoos.count > 10 {
            tattoos.removeLast()
        }
        UserDefaultManager.updateRecentTattoos(tattoos: tattoos)
    }
    
    public static func recentViewTattoos() -> Observable<[Model.Tattoo]> {
        print(UserDefaultManager.getRecentTattoos())
        return .just(UserDefaultManager.getRecentTattoos())
    }
    
    public static func recommendTattoos() -> Observable<[Model.Tattoo]> {
        
//        typealias CategoryId = Int
//        typealias Count = Int
//
//        var categoryCount: [CategoryId: Count] = [:]
//        UserDefaultManager.getRecentTattoos().forEach {
//            if let count = categoryCount[$0.categoryId] {
//                categoryCount[$0.categoryId] = count + 1
//            } else {
//                categoryCount[$0.categoryId] = 1
//            }
//        }
//
//        if let maxId = categoryCount.sorted(by: { $0.value > $1.value }).first?.key {
//            return CatSDKNetworkTattoo.rx.fetchTattosInSpecificCategory(categoryID: maxId)
//        } else {
//            return .just([])
//        }

        return .just([])
    }
    
    public static func famousTattoos(page: Int, size: Int) -> Observable<[Model.Tattoo]> {
        return CatSDKNetworkTattoo.rx.fetchTattoos(page: page, size: size, sort: "likesCount", direction: "DESC")
    }
}
