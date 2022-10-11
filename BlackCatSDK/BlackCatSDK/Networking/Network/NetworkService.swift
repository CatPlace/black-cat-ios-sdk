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
    init() { }

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
        let endpoint = MultiTarget.target(api)

        return provider.rx.request(endpoint)
            .flatMap { response in
                do {
                    // statusCode 검사하기
                    _ = try response.filterSuccessfulStatusCodes()

                    return .just(try response.map(API.Response.self))
                } catch NetworkError.httpStatus(let statusCode) {
                    return .error(NetworkError.httpStatus(statusCode))
                } catch MoyaError.objectMapping(_, let response) {
                    // response에 값이 없이 올 때 매핑 실패가 일어납니다.
                    // 따로 성공 케이스로 처리해주어햡니다.
                    if response.statusCode == 200 {
                        return .just(API.DTO)
                    }
                    print("☠️☠️ \(response) 데이터를 파싱하는 곳에서 오류가 납니다.")
                    return .error(NetworkError.objectMapping)
                }
            }
    }
}
