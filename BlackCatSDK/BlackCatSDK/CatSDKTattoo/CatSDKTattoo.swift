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
            _ = tattoos.popLast()
        }
        UserDefaultManager.updateRecentTattoos(tattoos: tattoos)
    }
    
    public static func recentViewTattoos() -> Observable<[Model.Tattoo]> {
        print(UserDefaultManager.getRecentTattoos())
        return .just(UserDefaultManager.getRecentTattoos())
    }
    
    public static func recommendTattoos() -> Observable<[Model.Tattoo]> {
        // TODO: - id를 카테고리로 변경 많이 등장한 카테고리 -> 서버통신 -> return
        let genres = UserDefaultManager.getRecentTattoos().map { $0.id }
        
        return .just([])
    }
    
    public static func famousTattoos() -> Observable<[Model.Tattoo]> {
        return .just([])
    }
}
