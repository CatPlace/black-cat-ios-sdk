//
//  CatSDKTattooist.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/14.
//


import Foundation
import RxSwift

public class CatSDKTattooist {
    public static func localTattooistInfo() -> Model.TattooistInfo {
        UserDefaultManager.getTattooistInfo()
    }
    
    public static func updateLocalTattooistInfo(tattooistInfo: Model.TattooistInfo) {
        UserDefaultManager.updateTattooistInfo(tattooistInfo: tattooistInfo)
    }
    
    public static func profile(tattooistId: Int) -> Observable<Model.TattooistIntroduce> {
        CatSDKNetworkProfile.rx.profile(tattooistId: tattooistId)
            .catch { _ in .just(.init(introduce: "error"))}
            .debug("프로필 패치")
    }
    
    public static func products(tattooistId: Int) -> Observable<[Model.TattooThumbnail]> {
        CatSDKNetworkTattoo.rx.fetchTattosInSpecificTattooist(tattooistId: tattooistId)
            .catch { _ in .just([])}
            .debug("타투 패치")
    }
    
    public static func priceInfo(tattooistId: Int) -> Observable<Model.TattooistEstimate> {
        CatSDKNetworkEstimate.rx.estimate(tattooistId: tattooistId)
            .catch { _ in .just(.init(description: "error"))}
            .debug("견적 패치")
    }
    
    public static func updateProfile(introduce: String, deleteImageUrls: [String] = [], images: [Data] = []) -> Observable<Model.TattooistIntroduce> {
        
        CatSDKNetworkProfile.rx.postProfile(introduce: introduce, deleteImageUrls: deleteImageUrls, images: images)
            .catch { _ in .just(.init(introduce: "error"))}
    }
    
    public static func updateProduct(tattooistId: Int?, tattooImageDatas: [Data], tattooInfo: Model.UpdateTattoo.Request) -> Observable<Model.TattooThumbnail> {
        if let tattooistId {
            return CatSDKNetworkTattoo.rx.updateTattoo(tattooId: tattooistId, tattooImageDatas: tattooImageDatas, tattooInfo: tattooInfo).map { .init(tattooId: $0.tattooId, imageUrlString: $0.imageUrls.first ?? "") }.catch { _ in .just(.init(tattooId: -1, imageUrlString: "")) }
        } else {
            return CatSDKNetworkTattoo.rx.addTattoo(tattooImageDatas: tattooImageDatas, postTattooModel: .init(tattooType: tattooInfo.tattooType, categoryId: tattooInfo.categoryId, title: tattooInfo.title, price: tattooInfo.price, description: tattooInfo.description, deleteImageUrls: tattooInfo.deleteImageUrls)).map { .init(tattooId: $0.tattooId, imageUrlString: $0.imageUrls.first ?? "") }.catch { _ in .just(.init(tattooId: -1, imageUrlString: "")) }
        }
    }
    
    public static func updatePriceInfo(estimate: Model.TattooistEstimate) -> Observable<Model.TattooistEstimate> {
        CatSDKNetworkEstimate.rx.postEstimate(description: estimate.description)
            .catch { _ in .just(.init(description: "error"))}
    }
}
