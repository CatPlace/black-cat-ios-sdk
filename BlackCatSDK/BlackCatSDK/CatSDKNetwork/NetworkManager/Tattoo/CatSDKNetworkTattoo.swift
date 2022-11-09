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
        networkService.request(TattooListAPI(page: page, size: size)) { result in
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
        page: Int,
        size: Int = 3,
        completion: @escaping (Result<[Model.Tattoo], Error>) -> Void
    ) {
        networkService.request(TattooInSpecificCategoryAPI(categoryID: id, page: page, size: size)) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooListDTOToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkTattoo {
    public static func fetchTattoos(
        page: Int,
        size: Int = 3
    ) -> Observable<[Model.Tattoo]> {
        Base.networkService.rx.request(TattooListAPI(page: page, size: size))
            .compactMap { Base.converter.convertTattooListDTOToModel($0) }
            .asObservable()
    }

    public static func fetchTattosInSpecificCategory(
        categoryID id : Int,
        page: Int,
        size: Int = 3
    ) -> Observable<[Model.Tattoo]> {
        Base.networkService.rx.request(TattooInSpecificCategoryAPI(categoryID: id, page: page, size: size))
            .compactMap { Base.converter.convertTattooListDTOToModel($0) }
            .asObservable()
    }
}
