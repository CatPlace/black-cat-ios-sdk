//
//  CatSDKNetworkUser.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/20.
//

import Foundation
import RxSwift

class CatSDKNetworkUser: CatSDKNetworkable {
    private init() {}
    static func login(
        providerType: String,
        providerToken: String,
        completion: @escaping (Result<Model.User, Error>) -> Void
    ) {
        networkService.request(LoginAPI(request: .init(providerType: providerType,
                                                       providerToken: providerToken))) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertUserDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public static func updateUser() {
        
    }
}

extension Reactive where Base: CatSDKNetworkUser {
    static func login(providerType: String,
                             providerToken: String) -> Observable<Model.User> {
        Base.networkService.rx.request(LoginAPI(request: .init(providerType: providerType,
                                                               providerToken: providerToken)))
        .debug("login API🥸")
        .compactMap(Base.converter.convertUserDTOToModel)
        .asObservable()
    }
}
