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
    
    public static func profile(profileId: Int) -> Observable<Model.TattooistIntroduce> {
        CatSDKNetworkProfile.rx.profile(profileId: profileId)
            .catch { _ in .just(.init(introduce: "error", userImageUrlString: "", userName: "", addressId: 0))}
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
            .catch { _ in .just(.init(introduce: "error", userImageUrlString: "", userName: "'", addressId: 0))}
    }
    
    public static func updateProduct(tattooId: Int?, tattooImageDatas: [Data], tattooInfo: Model.UpdateTattoo.Request) -> Observable<Model.TattooThumbnail> {
        if let tattooId {
            return CatSDKNetworkTattoo.rx.updateTattoo(tattooId: tattooId, tattooImageDatas: tattooImageDatas, tattooInfo: tattooInfo).map { .init(tattooId: $0.tattooId, imageUrlString: $0.imageUrls.first ?? "") }.catch { _ in .just(.init(tattooId: -1, imageUrlString: "")) }
        } else {
            return CatSDKNetworkTattoo.rx.addTattoo(tattooImageDatas: tattooImageDatas, postTattooModel: .init(tattooType: tattooInfo.tattooType, categoryId: tattooInfo.categoryId, title: tattooInfo.title, price: tattooInfo.price, description: tattooInfo.description, deleteImageUrls: tattooInfo.deleteImageUrls)).map { .init(tattooId: $0.tattooId, imageUrlString: $0.imageUrls.first ?? "") }.catch { _ in .just(.init(tattooId: -1, imageUrlString: "")) }
        }
    }
    
    public static func updatePriceInfo(estimate: Model.TattooistEstimate) -> Observable<Model.TattooistEstimate> {
        CatSDKNetworkEstimate.rx.postEstimate(description: estimate.description)
            .catch { _ in .just(.init(description: "error"))}
    }
    
    public static func deleteTattoo(tattooIds: [Int]) -> Observable<([Int], [Int])> {
        CatSDKNetworkTattoo.rx.removeTattoo(tattooIdList: tattooIds)
            .map { (beforeData: tattooIds, afterData: $0) }
            .catch { _ in .just((beforeData: tattooIds, afterData: []))}
    }
    
    public static func updateTattooist(deletedTattooId: Int) {
        print(deletedTattooId, "💡💡💡")
        var tattooistInfo = UserDefaultManager.getTattooistInfo()
        tattooistInfo.tattoos.removeAll { tattoo in
            tattoo.tattooId == deletedTattooId
        }
        UserDefaultManager.updateTattooistInfo(tattooistInfo: tattooistInfo)
    }
    
}
