//
//  PostTattoo.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import Moya

struct PostTattooAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.Post.Response

    var tattooImageDatas: [Data]
    var tattooInfo: DTO.Tattoo.Post.Request
    init(
        tattooImageDatas: [Data],
        tattooInfo: DTO.Tattoo.Post.Request
    ) {
        self.tattooImageDatas = tattooImageDatas
        self.tattooInfo = tattooInfo
    }
    var path: String = "tattoos"
    var method: Moya.Method { .post }
    var multiPartFormDatas: [MultipartFormData] {
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
