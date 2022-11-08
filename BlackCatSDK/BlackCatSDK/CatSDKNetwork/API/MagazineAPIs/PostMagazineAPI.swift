//
//  PostMagazineAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

import Moya

struct PostMagazineAPI: ServiceAPI {
    typealias Response = DTO.PostMagazine

    var request: Request
    var path: String = "magazines"
    var method: Moya.Method { .post }
    var task: Moya.Task {
        .requestJSONEncodable(request)
    }
    var headers: [String : String]? {
        return ["Content-Type": "Application/json"]
    }
}

extension PostMagazineAPI {
    struct Request: Encodable {
        let title: String
        let imageUrl: String?
        let data: [CellInfo]

        struct CellInfo: Encodable {
            let cellType: String
            let text: String
            let fontSize: String
            let textColor: String
            let textAlignment: String
            let fontWeight: String
            let imageUrlString: String?
            let imageCornerRadius: Int
            let layoutHeight: Int
            let layoutWidth: Int
            let layoutLeadingInset: Int
            let layoutTrailingInset: Int
            let layoutTopInset: Int
            let layoutBottomInset: Int
        }

        init(
            title: String,
            imageUrl: String?,
            data: [CellInfo]
        ) {
            self.title = title
            self.imageUrl = imageUrl
            self.data = data
        }
    }
}
