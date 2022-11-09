//
//  CatSDKNetworkCategory.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

import RxCocoa
import RxSwift

public class CatSDKNetworkCategory: CatSDKNetworkable {
    private init() {}

    public static func fetchCategories(completion: @escaping (Result<[Model.Category], Error>) -> Void) {
        networkService.request(CategoryListAPI()) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertCategoryListDTOToModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkCategory {
    public static func fetchCategories() -> Observable<[Model.Category]> {
        Base.networkService.rx.request(CategoryListAPI())
            .compactMap { Base.converter.convertCategoryListDTOToModel($0) }
            .asObservable()
    }
}

