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
    func requestWithRx<API>(_ api: API) -> Single<API.Response> where API: ServiceAPI
}

class NetworkService: NetworkServable {
    init() {}

    func request<API>(_ api: API, completion: @escaping (Result<API.Response, Error>) -> Void) where API : ServiceAPI {
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

    func requestWithRx<API>(_ api: API) -> Single<API.Response> where API : ServiceAPI {
        let provider = MoyaProvider<MultiTarget>()
        let endpoint = MultiTarget(api)

        return provider.rx.request(endpoint)
            .flatMap { response -> Single<API.Response> in
                do {
                    // statusCode 검사하기
                    _ = try response.filterSuccessfulStatusCodes()

                    return Single.just(try response.map(API.Response.self))
                } catch MoyaError.statusCode(let response) {
                    print("Error: \(response.statusCode)")
                    return Single.error(NetworkError.statusCode(response.statusCode))
                } catch MoyaError.objectMapping(_, let response) {
                    // response에 값이 없이 올 때 매핑 실패가 일어납니다.
                    // 따로 성공 케이스로 처리해주어햡니다.
//                    if response.statusCode == 200 {
//                        return .just(API.DTO)
//                    }
                    print("☠️☠️ \(response) 데이터를 파싱하는 곳에서 오류가 납니다.")
                    return Single.error(NetworkError.objectMapping)
                }
            }
    }

    enum NetworkError: Error {
        /** Decodable 객체로 매핑 실패 시  */ case objectMapping
        /** statusCode가 200...299 범위 밖일 때 */ case statusCode(Int)
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
