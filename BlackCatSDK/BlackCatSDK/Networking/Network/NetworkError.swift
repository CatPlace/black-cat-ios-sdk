//
//  NetworkError.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

// TODO: - 네트워크 에러 종류, description은 같이 생각해보면 좋을 것 같아요

public enum NetworkError: Error {
    /** Decodable 객체로 매핑 실패 시  */ case objectMapping
    /** statusCode가 200...299 범위 밖일 때 */ case statusCode(Int)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .objectMapping:
            return ""
        case .statusCode(let statusCode):
            return "적절하지 않은 StatusCode입니다. StatusCode: \(statusCode)"
        }
    }
}
