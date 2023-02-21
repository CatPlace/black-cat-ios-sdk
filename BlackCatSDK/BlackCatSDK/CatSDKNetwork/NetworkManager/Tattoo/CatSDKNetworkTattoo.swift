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
    
    /// 타투 등록
    public static func addTattoo(
        tattooImageDatas: [Data],
        postTattooModel: Model.UpdateTattoo.Request,
        completion: @escaping (Result<Model.UpdateTattoo.Response, Error>) -> Void
    ) {
        networkService.request(AddTattooAPI(
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
    
    /// 전체 타투 조회
    public static func fetchTattoos(
        page: Int?,
        size: Int = 3,
        sort: String? = "likesCount",
        direction: String? = "DESC",
        tattooTypes: [String]?,
        addressIds: [Int]?,
        completion: @escaping (Result<[Model.Tattoo], Error>) -> Void
    ) {
        networkService.request(TattooListAPI(page: page, size: size, sort: sort, direction: direction, tattooTypes: tattooTypes, addressIds: addressIds)) { result in
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
    
    /// 타투 상세 조회
    public static func tattooDetail(
        tattooID id: Int,
        completion: @escaping (Result<Model.Tattoo, Error>) -> Void
    ) {
        networkService.request(TattooAPI(tattooId: id)) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooDetailDTOToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 타투 삭제
    public static func removeTattoo(
        tattooIdList: [Int],
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        networkService.request(DeleteTattooAPI(request: .init(tattooIds: tattooIdList))) { result in
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 타투이스트의 작품 조회
    public static func fetchTattosInSpecificTattooist(
        tattooistId: Int,
        page: Int? = nil,
        size: Int? = nil,
        completion: @escaping (Result<[Model.TattooThumbnail], Error>) -> Void
    ) {
        networkService.request(TattooInSpecificTattooistAPI(tattooistId: tattooistId)) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertTattooThumbnailDTOToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 타투 수정
    public static func updateTattoo(
        tattooImageDatas: [Data],
        tattooInfo: Model.UpdateTattoo.Request,
        completion: @escaping (Result<Model.UpdateTattoo.Response, Error>) -> Void
    ) {
        networkService.request(AddTattooAPI(
            tattooImageDatas: tattooImageDatas,
            tattooInfo: converter.createPostTattooRequest(tattooInfo))
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
    /// 타투 등록
    public static func addTattoo(
        tattooImageDatas: [Data],
        postTattooModel: Model.UpdateTattoo.Request
    ) -> Observable<Model.UpdateTattoo.Response> {
        Base.networkService.rx.request(AddTattooAPI(
            tattooImageDatas: tattooImageDatas,
            tattooInfo: Base.converter.createPostTattooRequest(postTattooModel))
        )
        .compactMap { Base.converter.convertPostTattooResponseDTOToModel($0) }
        .asObservable()
    }
    
    /// 전체 타투 조회
    public static func fetchTattoos(
        page: Int? = nil,
        size: Int = 3,
        sort: String? = nil,
        direction: String? = "DESC",
        tattooTypes: [String]? = nil,
        addressIds: [Int]? = nil
    ) -> Observable<[Model.Tattoo]> {
        Base.networkService.rx.request(TattooListAPI(page: page, size: size, sort: sort, direction: direction, tattooTypes: tattooTypes, addressIds: addressIds))
            .compactMap { Base.converter.convertTattooListDTOToModel($0) }
            .asObservable()
    }
    
    /// 특정 카테고리에 속한 타투 조회
    public static func fetchTattosInSpecificCategory(
        categoryID id : Int,
        page: Int? = nil,
        size: Int = 3,
        sort: String? = nil,
        direction: String? = "DESC",
        tattooTypes: [String]? = nil,
        addressIds: [Int]? = nil
    ) -> Observable<[Model.Tattoo]> {
        Base.networkService.rx.request(TattooInSpecificCategoryAPI(categoryID: id, tattooTypes: tattooTypes, addressIds: addressIds))
            .compactMap { Base.converter.convertTattooListDTOToModel($0) }
            .asObservable()
    }
    
    /// 타투 상세 조회
    public static func tattooDetail(
        tattooID id: Int
    ) -> Observable<Model.Tattoo> {
        Base.networkService.rx.request(TattooAPI(tattooId:id))
            .compactMap(Base.converter.convertTattooDetailDTOToModel)
            .asObservable()
    }
    
    /// 타투 삭제
    public static func removeTattoo(
        tattooIdList: [Int]
    ) -> Observable<[Int]> {
        Base.networkService.rx.request(DeleteTattooAPI(request: .init(tattooIds: tattooIdList))).map { $0.deletedTattooIds }.asObservable()
    }
    
    /// 타투이스트의 작품 조회
    public static func fetchTattosInSpecificTattooist(
        tattooistId: Int,
        page: Int? = nil,
        size: Int? = nil
    ) -> Observable<[Model.TattooThumbnail]> {
        Base.networkService.rx.request(TattooInSpecificTattooistAPI(tattooistId: tattooistId))
            .compactMap(Base.converter.convertTattooThumbnailDTOToModel)
            .asObservable()
    }
    
    /// 타투 수정
    public static func updateTattoo(
        tattooId: Int,
        tattooImageDatas: [Data],
        tattooInfo: Model.UpdateTattoo.Request
    ) -> Observable<Model.UpdateTattoo.Response> {
        Base.networkService.rx.request(ModifyTattooAPI(
            tattooId: tattooId,
            tattooImageDataList: tattooImageDatas,
            tattooInfo: Base.converter.createPostTattooRequest(tattooInfo))
        )
        .compactMap(Base.converter.convertPostTattooResponseDTOToModel)
        .asObservable()
    }
    
}
