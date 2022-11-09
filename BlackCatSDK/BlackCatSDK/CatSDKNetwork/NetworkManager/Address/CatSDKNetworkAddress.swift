//
//  CatSDKNetworkAddress.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import RxSwift

public class CatSDKNetworkAddress: CatSDKNetworkable {
    private init() {}

    public static func searchAddress(
        page: Int,
        size: Int,
        completion: @escaping (Result<[Model.Address], Error>) -> Void
    ) {
        networkService.request(AddressSearchAPI(page: page, size: size)) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertAddressDTOToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkAddress {
    public static func searchAddress(
        page: Int,
        size: Int
    ) -> Observable<[Model.Address]> {
        Base.networkService.rx.request(AddressSearchAPI(page: page, size: size))
            .compactMap { Base.converter.convertAddressDTOToModel($0) }
            .asObservable()
    }
}
