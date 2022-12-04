//
//  CatSDKNetworkUser.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/20.
//

import Foundation
import RxSwift

public class CatSDKNetworkUser: CatSDKNetworkable {
    private init() {}
    public static func login(
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
    
    public static func editUser() {
        
    }
}

extension Reactive where Base: CatSDKNetworkUser {
    public static func login(providerType: String,
                             providerToken: String) -> Observable<Model.User> {
        Base.networkService.rx.request(LoginAPI(request: .init(providerType: providerType,
                                                               providerToken: providerToken)))
        // TODO: id, jwt nil로 내려옴 (서버 개발자에게 전달)
        .debug("login API🥸")
        .compactMap(Base.converter.convertUserDTOToModel)
        .asObservable()
    }
}
