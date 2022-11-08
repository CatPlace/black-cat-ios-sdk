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

    func convertCategoryListDTOToModel(_ DTO: DTO.Category) -> [Model.Category] {
        return DTO.list.map { detail in
                .init(id: detail.id, name: detail.name, count: detail.count)
        }
    }
}
