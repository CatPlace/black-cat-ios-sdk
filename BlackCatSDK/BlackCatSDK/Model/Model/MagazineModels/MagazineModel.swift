//
//  MagazineModel.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension Model {
    public struct Magazine {
        let id: Int
        let title: String
        let imageURLString: String?
        let isMain: Bool
    }
}

