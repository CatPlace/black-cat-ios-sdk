//
//  CatSDKNetworkEstimate.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/01.
//

import Foundation
import RxSwift

public class CatSDKNetworkEstimate: CatSDKNetworkable {
    private init() {}
    
    /// 견적 등록/수정
    public static func postEstimate(
        description: String,
        completion: @escaping (Result<Model.TattooistEstimate, Error>) -> Void
    ) {
        networkService.request(PostTattooistEstimateAPI(request: .init(description: description))) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooistEstimateToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 견적 조회
    public static func estimate(completion: @escaping (Result<Model.TattooistEstimate, Error>) -> Void) {
        networkService.request(TattooistEstimateAPI()) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooistEstimateToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkProfile {
    /// 견적 등록/수정
    public static func postEstimate(
        description: String
    ) -> Observable<Model.TattooistEstimate> {
        Base.networkService.rx.request(PostTattooistEstimateAPI(request: .init(description: description)))
            .compactMap(Base.converter.convertTattooistEstimateToModel)
            .asObservable()
    }
    
    /// 견적 조회
    public static func estimate() -> Observable<Model.TattooistEstimate> {
        Base.networkService.rx.request(TattooistEstimateAPI())
            .compactMap(Base.converter.convertTattooistEstimateToModel)
            .asObservable()
    }
}
