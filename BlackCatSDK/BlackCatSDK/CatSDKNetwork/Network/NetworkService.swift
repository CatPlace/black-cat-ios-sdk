//
//  NetworkService.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

import RxCocoa
import RxSwift
import RxMoya
import Moya

protocol NetworkServable {
    func request<API>(_ api: API, completion: @escaping (Result<API.Response, Error>) -> Void) where API: ServiceAPI
}

class NetworkService: NetworkServable {
    init() {}

    func request<API>(
        _ api: API,
        completion: @escaping (Result<API.Response, Error>) -> Void
    ) where API : ServiceAPI {

        let provider = MoyaProvider<API>()

        provider.request(api) { result in
            switch result {
            case .success(let response):
                do {
                    _ = try response.filterSuccessfulStatusCodes()
                    let decodedData = try response.map(API.Response.self)

                    completion(.success(decodedData))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

//    extension NetworkError: LocalizedError {
//        public var errorDescription: String? {
//            switch self {
//            case .objectMapping:
//                return ""
//            case .statusCode(let statusCode):
//                return "적절하지 않은 StatusCode입니다. StatusCode: \(statusCode)"
//            }
//        }
//    }
}
