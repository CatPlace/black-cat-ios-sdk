//
//  NetworkError.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

enum NetworkError: Error {
    /** Decodable 객체로 매핑 실패 시  */ case objectMapping
    /** statusCode가 200...299 범위 밖일 때 */ case statusCode(Int)
}
