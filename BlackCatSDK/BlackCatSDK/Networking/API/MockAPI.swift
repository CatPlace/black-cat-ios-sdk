//
//  MockAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

import Moya

public struct MockAPI: ServiceAPI {
    public typealias Response = DTO.Mock

    public var baseURL: URL { return URL(string: "https://jsonplaceholder.typicode.com/")! }

    public var path: String { return "/comments/1" }

    public var method: Moya.Method { return .get }

    public var task: Moya.Task { return .requestPlain }

    public var headers: [String : String]? { return nil }
}
