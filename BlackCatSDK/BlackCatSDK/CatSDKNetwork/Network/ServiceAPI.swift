//
//  ServiceAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation
import Moya
import BlackCatKEY



public protocol ServiceAPI: TargetType {
    associatedtype Response: Decodable

    var path: String { get }
    var method: Moya.Method { get }
    var task: Moya.Task { get }
}

extension ServiceAPI {
    var baseURL: URL {
        return URL(string: BlackCatKEY.urlString)!
    }
    var headers: [String : String]? { [
        "Authorization": BlackCatKEY.testJWT
    ] }
}
