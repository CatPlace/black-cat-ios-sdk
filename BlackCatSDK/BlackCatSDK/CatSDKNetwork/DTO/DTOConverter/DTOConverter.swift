//
//  DTOtoModelConverter.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

struct DTOConverter {
    // MARK: - Category
    func convertCategoryListDTOToModel(_ DTO: [DTO.Category.List]) -> [Model.Category] {
        DTO.map { category in
            .init(id: category.id, name: category.name, count: category.count)
        }
    }
    
    // MARK: - USER
    func convertUserLoginDTOToModel(_ DTO: DTO.User.Login.Response) -> Model.User {
        return .init(id: DTO.userId, jwt: DTO.accessToken)
    }
    
    func convertUpdateUserProfileDTOToModel(_ DTO: DTO.User.UpdateProfile.Response) -> Model.User {
        
        return .init(id: -1, name: DTO.name, imageUrl: DTO.imageUrl.first, email: DTO.email, phoneNumber: DTO.phoneNumber, gender: Model.Gender.clientValue(DTO.gender), area: .init(rawValue: DTO.addressId), userType: .guest)
    }
    
    
    // MARK: - Tattoo
    func convertTattooListDTOToModel(_ DTO: DTO.Tattoo.List) -> [Model.Tattoo] {
        DTO.tattoos.map { tattoo in
                .init(id: tattoo.id, ownerName: tattoo.tattooistName ?? "", price: tattoo.price, description: tattoo.description, liked: tattoo.liked, imageURLStrings: tattoo.imageUrls, address: tattoo.address, ownerId: tattoo.tattooistId, tattooType: tattoo.tattooType, categoryId: tattoo.categoryId, likeCount: tattoo.likeCount)
        }
    }
    
    func convertTattooDetailDTOToModel(_ DTO: DTO.Tattoo.List.Tattoo) -> Model.Tattoo {
        .init(id: DTO.id, ownerName: DTO.tattooistName ?? "", price: DTO.price, description: DTO.description, liked: DTO.liked, imageURLStrings: DTO.imageUrls, address: DTO.address, ownerId: DTO.tattooistId, tattooType: DTO.tattooType, categoryId: DTO.categoryId, likeCount: DTO.likeCount)
        
    }
    
    func convertTattooThumbnailDTOToModel(_ DTO: DTO.Tattoo.ThumbnailList.Response) -> [Model.TattooThumbnail] {
        DTO.tattoos.map { tattoo in
                .init(tattooId: tattoo.id, imageUrlString: tattoo.imageUrl)
        }
        
    }
    
    func convertPostTattooResponseDTOToModel(_ DTO: DTO.Tattoo.Update.Response) -> Model.UpdateTattoo.Response {
        .init(tattooId: DTO.tattooId, imageUrls: DTO.imageUrls)
    }
    
    func createPostTattooRequest(_ model: Model.UpdateTattoo.Request) -> DTO.Tattoo.Update.Request {
        .init(tattooType: model.tattooType,
              categoryId: model.categoryId,
              title: model.title,
              price: model.price,
              description: model.description
        )
    }
    
    // MARK: - Address
    func convertAddressDTOToModel(_ DTO: DTO.Address.List) -> [Model.Address] {
        DTO.addresses.map { address in
                .init(id: address.id,
                      sido: address.sido)
        }
    }
    
    // MARK: - Bookmark
    
    func convertStatusOfBookmarkDTOToModel(_ DTO: DTO.Bookmark.StatusOfBookmark) -> Model.StatusOfBookmark {
        .init(liked: DTO.liked)
    }
    
    func convertUserListSpecificInBookmarkDTOToModel(_ DTO: DTO.Bookmark.UserListInSpecificBookmark) -> [Model.UserBookmarkPost] {
        DTO.content.map { user in
                .init(likesId: user.likesId,
                      userId: user.userId,
                      nickname: user.nickname,
                      createdDate: user.createdDate)
        }
    }
    
    func convertBookmarkListUserLikedDTOToModel(_ DTO: DTO.Bookmark.BookmarkListUserLiked) -> [Model.TattooBookmark] {
        DTO.content.map { post in
                .init(likesId: post.likesId,
                      postId: post.postId,
                      postType: post.postType,
                      title: post.title,
                      imageUrl: "https://blackcat.pe.kr/api/v1" + post.imageUrl,
                      createdDate: post.createdDate)
        }
    }
    
    // MARK: - TattooistProfile
    func convertTattooistIntroduceToModel(_ DTO: DTO.TattooistProfile.Introduce.Response) -> Model.TattooistIntroduce {
        .init(introduce: DTO.introduce, imageUrlString: DTO.imageUrls)
    }
    func convertTattooistEstimateToModel(_ DTO: DTO.TattooistProfile.Estimate) -> Model.TattooistEstimate {
        .init(description: DTO.description)
    }
    
    // MARK: - Magazine
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
}
