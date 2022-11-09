//
//  MagazineDetail.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension DTO {
    struct MagazineDetail: Decodable {
        let status: String
        let cellInfos: [CellInfo]
        let error: String?
        let code: Int

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
            case status, error, code
            case cellInfos = "data"
        }
    }
}
