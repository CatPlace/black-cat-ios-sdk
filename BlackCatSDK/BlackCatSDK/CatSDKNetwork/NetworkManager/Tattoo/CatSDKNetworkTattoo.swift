//
//  CatSDKNetworkTattoo.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import RxSwift

public class CatSDKNetworkTattoo: CatSDKNetworkable {
    private init() {}

    /// 전체 타투 조회
    public static func fetchTattoos(
        page: Int,
        size: Int = 3,
        completion: @escaping (Result<[Model.Tattoo], Error>) -> Void
    ) {
        networkService.request(TattooListAPI()) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooListDTOToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    /// 특정 카테고리에 속한 타투 조회
    public static func fetchTattosInSpecificCategory(
        categoryID id: Int,
        completion: @escaping (Result<[Model.Tattoo], Error>) -> Void
    ) {
        networkService.request(TattooInSpecificCategoryAPI(categoryID: id)) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooListDTOToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public static func postTattoo(
        tattooImageDatas: [Data],
        postTattooModel: Model.PostTattoo.Request,
        completion: @escaping (Result<Model.PostTattoo.Response, Error>) -> Void
    ) { 
        networkService.request(PostTattooAPI(
            tattooImageDatas: tattooImageDatas,
            tattooInfo: converter.createPostTattooRequest(postTattooModel))
        ) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertPostTattooResponseDTOToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkTattoo {
    public static func fetchTattoos(
        tattooType: String? = nil,
        addressId: Int? = nil
    ) -> Observable<[Model.Tattoo]> {
        Base.networkService.rx.request(TattooListAPI(tattooType: tattooType, addressId: addressId))
            .compactMap { Base.converter.convertTattooListDTOToModel($0) }
            .asObservable()
    }

    public static func fetchTattosInSpecificCategory(
        categoryID id : Int,
        tattooType: String? = nil,
        addressId: Int? = nil
    ) -> Observable<[Model.Tattoo]> {
        Base.networkService.rx.request(TattooInSpecificCategoryAPI(categoryID: id, tattooType: tattooType, addressId: addressId))
            .compactMap { Base.converter.convertTattooListDTOToModel($0) }
            .asObservable()
    }

    public static func postTattoo(
        tattooImageDatas: [Data],
        postTattooModel: Model.PostTattoo.Request
    ) -> Observable<Model.PostTattoo.Response> {
        Base.networkService.rx.request(PostTattooAPI(
            tattooImageDatas: tattooImageDatas,
            tattooInfo: Base.converter.createPostTattooRequest(postTattooModel))
        )
        .compactMap { Base.converter.convertPostTattooResponseDTOToModel($0) }
        .asObservable()
    }
}
