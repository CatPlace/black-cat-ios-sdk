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
                completion(.success(converter.convertUserLoginDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func updateProfile(
        name: String,
        email: String,
        phoneNumber: String,
        gender: String,
        addressId: Int,
        imageDataList: [Data]? = nil,
        deleteImageUrls: [String] = [],
        completion: @escaping (Result<Model.User, Error>) -> Void
    ) {
        networkService.request(UpdateProfileAPI(request: .init(userInfo: .init(name: name, email: email, phoneNumber: phoneNumber, gender: gender, addressId: addressId, deleteImageUrls: deleteImageUrls), imageDataList: imageDataList))) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertUpdateUserProfileDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func withdrawal(completion: @escaping (Result<Int, Error>) -> Void) {
        networkService.request(WithdrawalAPI()) { result in
            switch result {
            case .success(let dto):
                completion(.success(dto.userId))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkUser {
    static func login(
        providerType: String,
        providerToken: String
    ) -> Observable<Model.User> {
        Base.networkService.rx.request(LoginAPI(request: .init(providerType: providerType,
                                                               providerToken: providerToken)))
        .compactMap(Base.converter.convertUserLoginDTOToModel)
        .asObservable()
    }
    
    static func updateProfile(
        name: String,
        email: String,
        phoneNumber: String,
        gender: String,
        addressId: Int,
        imageDataList: [Data]? = nil,
        deleteImageUrls: [String] = []
    ) -> Observable<Model.User> {
        Base.networkService.rx.request(UpdateProfileAPI(request: .init(userInfo: .init(name: name, email: email, phoneNumber: phoneNumber, gender: gender, addressId: addressId, deleteImageUrls: deleteImageUrls), imageDataList: imageDataList)))
            .compactMap(Base.converter.convertUpdateUserProfileDTOToModel)
            .asObservable()
    }
    
    static func withdrawal() -> Observable<Bool> {
        Base.networkService.rx.request(WithdrawalAPI())
            .map { _ in true }
            .catch { _ in .just(false) }
            .asObservable()
    }
}
