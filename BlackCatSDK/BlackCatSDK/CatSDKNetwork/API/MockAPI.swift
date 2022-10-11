//
//  MockAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

import Moya

struct MockAPI: ServiceAPI {
    typealias Response = DTO.Mock

    var baseURL: URL { return URL(string: "https://jsonplaceholder.typicode.com")! }
    var path: String { return "/comments/1" }
    var method: Moya.Method { return .get }
    var task: Moya.Task { return .requestPlain }
    var headers: [String : String]? { return nil }
}
