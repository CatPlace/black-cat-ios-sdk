//
//  BlackCatSDKMock.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

// MARK: - 네트워크 사용 예시입니다.

public class CatSDKMock {
    private init() { }

    private static let networkService = NetworkService()
    private static let converter = DTOtoModelConverter()

    public static func fetchMockData(completion: @escaping (Result<Model.Mock, Error>) -> Void) {
        networkService.request(MockAPI()) { result in
            switch result {
            case .success(let DTO):
                completion(.success(converter.convertMockDTOToMockModel(DTO)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
