//
//  CatSDKNetworkProfile.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/01.
//

import Foundation
import RxSwift

public class CatSDKNetworkProfile: CatSDKNetworkable {
    private init() {}
    
    /// 타투이스트 프로필 등록/수정
    public static func postProfile(
        introduce: String,
        deleteImageUrls: [String] = [],
        images: [Data],
        completion: @escaping (Result<Model.TattooistIntroduce, Error>) -> Void
    ) {
        networkService.request(PostTattooistProfileAPI(request: .init(profileInfo: .init(introduce: introduce, deleteImageUrls: deleteImageUrls), images: images))) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooistIntroduceToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 타투이스트 프로필 조회
    public static func profile(
        profileId: Int,
        completion: @escaping (Result<Model.TattooistIntroduce, Error>) -> Void
    ) {
        networkService.request(TattooistProfileAPI(profileId: profileId)) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooistIntroduceToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkProfile {
    /// 타투이스트 프로필 등록/수정
    public static func postProfile(
        introduce: String,
        deleteImageUrls: [String] = [],
        images: [Data]
    ) -> Observable<Model.TattooistIntroduce> {
        Base.networkService.rx.request(PostTattooistProfileAPI(request: .init(profileInfo: .init(introduce: introduce, deleteImageUrls: deleteImageUrls), images: images)))
            .compactMap(Base.converter.convertTattooistIntroduceToModel)
            .asObservable()
    }
    
    /// 타투이스트 프로필 조회
    public static func profile(profileId: Int) -> Observable<Model.TattooistIntroduce> {
        Base.networkService.rx.request(TattooistProfileAPI(profileId: profileId))
            .compactMap(Base.converter.convertTattooistIntroduceToModel)
            .asObservable()
    }
}

