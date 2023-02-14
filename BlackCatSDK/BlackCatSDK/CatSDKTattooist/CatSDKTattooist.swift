//
//  CatSDKTattooist.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/14.
//


import Foundation
import RxSwift

public class CatSDKTattooist {
    public static func profile(tattooistId: Int) -> Observable<Model.TattooistIntroduce> {
        return CatSDKNetworkProfile.rx.profile(tattooistId: tattooistId)
            .catch { _ in .just(.init(introduce: "서버 통신 실패"))}
            .debug("프로필 패치")
    }
    
    public static func products(tattooistId: Int) -> Observable<[Model.TattooThumbnail]> {
        return CatSDKNetworkTattoo.rx.fetchTattosInSpecificTattooist(tattooistId: tattooistId)
            .catch { _ in .just([])}
            .debug("타투 패치")
    }
    
    public static func priceInfo(tattooistId: Int) -> Observable<Model.TattooistEstimate> {
        return CatSDKNetworkEstimate.rx.estimate(tattooistId: tattooistId)
            .catch { _ in .just(.init(description: "서버 통신 실패"))}
            .debug("견적 패치")
    }
    
    public static func updateProfile(with: Model.TattooistIntroduce) {}
    public static func updateProducts(with: [Model.TattooThumbnail]) {}
    public static func updatePriceInfo(with: Model.TattooistEstimate) {}
}
