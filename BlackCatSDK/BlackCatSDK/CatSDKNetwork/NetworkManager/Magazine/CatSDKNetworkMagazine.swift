//
//  CatSDKNetworkMagazine.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

import RxSwift

public class CatSDKNetworkMagazine: CatSDKNetworkable {
    private init() {}

    public static func fetchMagazines(
        completion: @escaping (Result<[Model.Magazine], Error>) -> Void
    ) {
        networkService.request(MagazineListAPI()) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertMagazineListDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public static func fetchMagazineDetail(
        for id: Int,
        completion: @escaping(Result<Model.MagazineDetail, Error>) -> Void
    ) {
        networkService.request(MagazineDetailAPI(id: id)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertMagazineDetailDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public static func createMagazine(
        request: Model.CreateMagazine.Request,
        completion: @escaping (Result<Model.CreateMagazine.Response, Error>) -> Void
    ) {
        networkService.request(PostMagazineAPI(request: converter.createPostMagazineRequest(request))) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertPostMagazineDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkMagazine {
    public static func fetchMagazines() -> Observable<[Model.Magazine]> {
        Base.networkService.rx.request(MagazineListAPI())
            .compactMap { Base.converter.convertMagazineListDTOToModel($0) }
            .asObservable()
    }

    public static func fetchMagazineDetail(for id: Int) -> Observable<Model.MagazineDetail> {
        Base.networkService.rx.request(MagazineDetailAPI(id: id))
            .compactMap { Base.converter.convertMagazineDetailDTOToModel($0) }
            .asObservable()
    }

    public static func createMagazine(request: Model.CreateMagazine.Request) -> Observable<Model.CreateMagazine.Response> {
        Base.networkService.rx.request(PostMagazineAPI(request: Base.converter.createPostMagazineRequest(request)))
            .compactMap { Base.converter.convertPostMagazineDTOToModel($0) }
            .asObservable()
    }
}
