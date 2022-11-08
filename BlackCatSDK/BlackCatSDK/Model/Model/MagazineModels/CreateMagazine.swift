//
//  CreateMagazine.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension Model {
    public enum CreateMagazine {
        public struct Request {
            let title: String
            let imageURLString: String?
            let cellInfos: [CellInfo]

            struct CellInfo {
                let type: String
                let text: String
                let fontSize: String
                let textColor: String
                let textAlignment: String
                let fontWeight: String
                let imageURLString: String?
                let imageCornerRadius: Int
                let layoutHeight: Int
                let layoutWidth: Int
                let layoutLeadingInset: Int
                let layoutTrailingInset: Int
                let layoutTopInset: Int
                let layoutBottomInset: Int
            }
        }

        public struct Response {
            let status: String
            let magazine: Magazine
            let error: String?
            let code: Int

            struct Magazine {
                let id: Int
                let title: String
                let imageURLString: String?
                let isMain: Bool
            }
        }
    }
}
