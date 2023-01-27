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

struct APIResponse<T: Decodable>: Decodable {
    let success: Bool
    let data: T?
    let message: String
}

protocol NetworkServable {
    func request<API>(_ api: API, completion: @escaping (Result<API.Response, NetworkError>) -> Void) where API: ServiceAPI
}

struct NetworkErrorResponse: Decodable {
    let errorCode: Int
    let message: String
}

class NetworkService: NetworkServable {
    init() {}

    func request<API>(
        _ api: API,
        completion: @escaping (Result<API.Response, NetworkError>) -> Void
    ) where API : ServiceAPI {

        let provider = MoyaProvider<API>()
        let endpoint = MultiTarget.target(api)
        print("endPoint: \(endpoint)")
        print("endPoint baseURL", endpoint.baseURL)
        print("endPoint path", endpoint.path)
        provider.request(api) { result in
            print(api.task)
            switch result {
            case .success(let response):
                do {
                    _ = try response.filterSuccessfulStatusCodes()
                    let decodedData = try response.map(APIResponse<API.Response>.self)
                    if let data = decodedData.data {
                        completion(.success(data))
                    }
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(handlingError(error)))
                }
            case .failure(let error):
                completion(.failure(handlingError(error)))
            }
        }

        func handlingError(_ error: Error) -> NetworkError {
            guard let moyaError = error as? MoyaError else {
                print("설마 여기?")
                return .unknown
            }

            let error: NetworkError

            switch moyaError {
            case .jsonMapping(_):
                error = .mappingError
            case .objectMapping(let decodingError, _):
                print(decodingError, "@@@@")
                error = .mappingError
            case .statusCode(let response):
                switch response.statusCode {
                case 400..<500:
                    do {
                        let errorModel = try response.map(NetworkErrorResponse.self)
                        error = .clientError(errorModel.errorCode, errorModel.message)
                    } catch {
                        let error = NetworkError.mappingError
                        print(error.localizedDescription)
                        return error
                    }
                default:
                    error = .statusCode(response.statusCode)
                }
                
            default: error = .unknown
            }

            print(error.localizedDescription)
            return error
        }
    }
}
