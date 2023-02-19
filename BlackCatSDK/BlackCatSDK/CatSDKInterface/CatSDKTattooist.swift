//
//  CatSDKTattooist.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/14.
//

import Foundation
import RxSwift

public class CatSDKTattooist {
    public static func profile() {
        
    }
    
    public static func products() -> Observable<[Model.Tattoo]> {

    }
    
    public static func priceInfo() -> Observable<[Model.Tattoo]> {

    }
    
    public static func famousTattoos(page: Int, size: Int) -> Observable<[Model.Tattoo]> {
        return CatSDKNetworkTattoo.rx.fetchTattoos(page: page, size: size, sort: "likesCount", direction: "DESC")
    }
}
