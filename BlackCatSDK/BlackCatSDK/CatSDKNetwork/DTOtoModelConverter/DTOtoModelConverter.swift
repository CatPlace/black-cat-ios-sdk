//
//  DTOtoModelConverter.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

class DTOtoModelConverter {
    func convertMockDTOToMockModel(_ DTO: DTO.Mock) -> Model.Mock {
        return .init(postID: DTO.postId,
                     name: DTO.name,
                     email: DTO.email,
                     body: DTO.body)
    }
}
