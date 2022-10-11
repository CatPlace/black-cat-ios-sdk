//
//  ServiceAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

import Moya

public protocol ServiceAPI: TargetType {
    associatedtype Response: Decodable

    // TODO: - baseURL, headers 등 공통으로 쓸 부분은 차후에 extension으로 빼겠습니다.

    var baseURL: URL { get }
    var path: String { get }
    var method: Moya.Method { get }
    var task: Moya.Task { get }
    var headers: [String : String]? { get }
}
