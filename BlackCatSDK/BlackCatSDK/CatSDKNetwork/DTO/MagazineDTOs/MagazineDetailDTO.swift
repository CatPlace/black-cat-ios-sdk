//
//  MagazineDetail.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension DTO {
    struct MagazineDetail: Decodable {
        let title: String
        let imageUrl: String?
        let cellInfos: [CellInfo]

        struct CellInfo: Decodable {
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

        enum CodingKeys: String, CodingKey {
            case title, imageUrl
            case cellInfos = "data"
        }
    }
}
