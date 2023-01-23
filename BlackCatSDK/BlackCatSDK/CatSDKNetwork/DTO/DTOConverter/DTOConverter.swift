//
//  DTOtoModelConverter.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

struct DTOConverter {

    func convertUserDTOToModel(_ DTO: DTO.User.Login.Response) -> Model.User {
        return .init(id: DTO.userId, jwt: DTO.accessToken)
    }
    
    func convertCategoryListDTOToModel(_ DTO: [DTO.Category.List.Category]) -> [Model.Category] {
        var categoryList: [Model.Category] = []

        let 전체보기Category = Model.Category(id: 0, name: "전체보기", count: 0)

        categoryList.append(전체보기Category)

        DTO.forEach { category in
            let category = Model.Category(id: category.id, name: category.name, count: category.count)
            categoryList.append(category)
        }

        return categoryList
    }

    func convertTattooListDTOToModel(_ DTO: DTO.Tattoo.List) -> [Model.Tattoo] {
        DTO.tattoos.map { tattoo in
            // TODO: DTO 수정 !! 타투이스트 이름
                .init(id: tattoo.id,
                      ownerName: "",
                      price: tattoo.price,
                      description: tattoo.description,
                      liked: tattoo.liked,
                      imageURLStrings: tattoo.imageUrls,
                      address: tattoo.address)
        }
    }

    func convertPostTattooResponseDTOToModel(_ DTO: DTO.Tattoo.Post.Response) -> Model.PostTattoo.Response {
        .init(tattooId: DTO.tattooId, imageUrls: DTO.imageUrls)
    }

    func createPostTattooRequest(_ model: Model.PostTattoo.Request) -> DTO.Tattoo.Post.Request {
        .init(tattooType: model.tattooType,
              categoryId: model.categoryId,
              title: model.title,
              price: model.price,
              description: model.description
        )
    }

    func convertMagazineListDTOToModel(_ DTO: DTO.Magazine.List) -> [Model.Magazine] {
        DTO.data.magazines.map { magazine in
                .init(id: magazine.id,
                      title: magazine.title,
                      imageURLString: magazine.imageURL,
                      isMain: magazine.isMain
                )
        }
    }

    func convertMagazineDetailDTOToModel(_ DTO: DTO.Magazine.Detail) -> Model.MagazineDetail {
        .init(status: DTO.status,
                     cellInfos: DTO.cellInfos.map { .init(type: $0.cellType,
                                                          text: $0.text,
                                                          fontSize: $0.fontSize,
                                                          textColor: $0.textColor,
                                                          textAlignment: $0.textAlignment,
                                                          fontWeight: $0.fontWeight,
                                                          imageURLString: $0.imageUrlString,
                                                          imageCornerRadius: $0.imageCornerRadius,
                                                          layoutHeight: $0.layoutHeight,
                                                          layoutWidth: $0.layoutWidth,
                                                          layoutLeadingInset: $0.layoutLeadingInset,
                                                          layoutTrailingInset: $0.layoutTrailingInset,
                                                          layoutTopInset: $0.layoutTopInset,
                                                          layoutBottomInset: $0.layoutBottomInset) },
                     error: DTO.error,
                     code: DTO.code
        )
    }

    func createPostMagazineRequest(_ model: Model.CreateMagazine.Request) -> PostMagazineAPI.Request {
        .init(title: model.title,
              imageUrl: model.imageURLString,
              data: model.cellInfos.map { .init(cellType: $0.type,
                                                text: $0.text,
                                                fontSize: $0.fontSize,
                                                textColor: $0.textColor,
                                                textAlignment: $0.textAlignment,
                                                fontWeight: $0.fontWeight,
                                                imageUrlString: $0.imageURLString,
                                                imageCornerRadius: $0.imageCornerRadius,
                                                layoutHeight: $0.layoutHeight,
                                                layoutWidth: $0.layoutWidth,
                                                layoutLeadingInset: $0.layoutLeadingInset,
                                                layoutTrailingInset: $0.layoutTrailingInset,
                                                layoutTopInset: $0.layoutTopInset,
                                                layoutBottomInset: $0.layoutBottomInset)
        })
    }

    func convertPostMagazineDTOToModel(_ DTO: DTO.Magazine.Post) -> Model.CreateMagazine.Response {
        .init(status: DTO.status,
              magazine: .init(id: DTO.magazine.id,
                              title: DTO.magazine.title,
                              imageURLString: DTO.magazine.imageUrl,
                              isMain: DTO.magazine.isMain),
              error: DTO.error,
              code: DTO.code
        )
    }

    func convertBookmarkListUserLikedDTOToModel(_ DTO: DTO.Bookmark.ListUserLiked) -> [Model.TattooBookmarkModel] {
        DTO.content.map { post in
                .init(likesId: post.likesId,
                      postId: post.postId,
                      postType: post.postType,
                      title: post.title,
                      imageUrl: "https://blackcat.pe.kr/api/v1" + post.imageUrl,
                      createdDate: post.createdDate)
        }
    }

    func convertAddressDTOToModel(_ DTO: DTO.Address.Search) -> [Model.Address] {
        DTO.addresses.map { address in
                .init(id: address.id,
                      zipCode: address.zipCode,
                      address: address.address)
        }
    }
}
