//
//  PostTattoo.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import Moya

struct PostTattooAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.Post

    var tattooImageDatas: [Data]
    var tattooInfo: TattooInfo
    var path: String = "tattoos"
    var method: Moya.Method { .post }
    var multiPartFormDatas: [MultipartFormData] {
        // TODO: - 멀티파트 폼 해결
        let tattooInfoData = try! JSONEncoder().encode(tattooInfo)
        var formDatas: [MultipartFormData] = [.init(provider: .data(tattooInfoData), name: "tattooInfo")]
        tattooImageDatas.forEach { imageData in
            formDatas.append(.init(provider: .data(imageData), name: "images"))
        }

        return formDatas
    }
    var task: Moya.Task {
        .uploadMultipart(multiPartFormDatas)
    }
}

extension PostTattooAPI {
    struct TattooInfo: Encodable {
        let tattooType: String
        let categoryId: Int
        let title: String
        let price: Int
        let description: String
    }
}
