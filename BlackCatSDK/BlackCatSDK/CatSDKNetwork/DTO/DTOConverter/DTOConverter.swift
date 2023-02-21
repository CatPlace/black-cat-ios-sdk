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
        guard let userType = Model.UserType.clientValue(serverValue: DTO.role) else {
            // NOTE: 유저타입 에러 ! 서버개발자와 논의 !
            return .init(id: -1)
        }
        return .init(
            id: DTO.userId,
            jwt: DTO.accessToken,
            name: DTO.userName,
            imageUrl: DTO.imageUrls.first,
            email: DTO.email,
            phoneNumber: DTO.phoneNumber,
            gender: Model.Gender.clientValue(serverValue: DTO.gender),
            area: Model.Area.clientValue(serverValue: DTO.addressId),
            userType: userType,
            profileId: DTO.profileId
        )
    }
    
    func convertUpdateUserProfileDTOToModel(_ DTO: DTO.User.UpdateProfile.Response) -> Model.User {
        
        return .init(
            id: -1,
            name: DTO.name,
            imageUrl: DTO.imageUrls.first,
            email: DTO.email, phoneNumber: DTO.phoneNumber,
            gender: Model.Gender.clientValue(serverValue: DTO.gender),
            area: Model.Area.clientValue(serverValue: DTO.addressId),
            userType: .guest
        )
    }
    
    
    // MARK: - Tattoo
    func convertTattooListDTOToModel(_ DTO: DTO.Tattoo.List) -> [Model.Tattoo] {
        DTO.tattoos.map { tattoo in
            convertTattooDetailDTOToModel(tattoo)
        }
    }
    
    func convertTattooDetailDTOToModel(_ DTO: DTO.Tattoo.List.Tattoo) -> Model.Tattoo {
        print(DTO, "😡😡😡😡😡😡😡😡😡😡😡😡😡😡😡😡😡")
        guard let tattooType = TattooType(rawValue: DTO.tattooType) else {
            // NOTE: 타투타입 에러 ! 서버개발자와 논의 !
            return .init(id: 0)
        }

        return .init(
            id: DTO.id,
            title: DTO.title,
            price: DTO.price,
            ownerId: DTO.tattooistId,
            profileId: DTO.profileId ?? -1,
            ownerName: DTO.tattooistName ?? "",
            description: DTO.description,
            address: DTO.address,
            imageURLStrings: DTO.imageUrls,
            tattooType: tattooType,
            categoryIds: DTO.categoryIds,
            likeCount: DTO.likeCount,
            createDate: DTO.createDate,
            profileImageUrls: DTO.profileImageUrls?.first
        )
    }
    
    func convertTattooThumbnailDTOToModel(_ DTO: DTO.Tattoo.ThumbnailList.Response) -> [Model.TattooThumbnail] {
        DTO.tattoos.map { tattoo in
                .init(tattooId: tattoo.tattooId, imageUrlString: tattoo.imageUrl)
        }
        
    }
    
    func convertPostTattooResponseDTOToModel(_ DTO: DTO.Tattoo.Update.Response) -> Model.UpdateTattoo.Response {
        .init(tattooId: DTO.tattooId, imageUrls: DTO.imageUrls)
    }
    
    func createPostTattooRequest(_ model: Model.UpdateTattoo.Request) -> DTO.Tattoo.Update.Request {
        
        // TODO: - 옵셔널 처리 고민
        .init(tattooType: model.tattooType.rawValue,
              categoryIds: model.categoryId,
              title: model.title,
              price: model.price,
              description: model.description,
              deleteImageUrls: model.deleteImageUrls
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
    
    func convertMultipleBookmarkPostDTOToModel(_ DTO: DTO.Bookmark.PostIds) -> Model.PostIds {
        .init(postIds: DTO.postIds)
    }
    
    func convertUserListSpecificInBookmarkDTOToModel(_ DTO: DTO.Bookmark.UserListInSpecificBookmark) -> [Model.UserBookmarkPost] {
        DTO.content.map { user in
                .init(likesId: user.likesId,
                      userId: user.userId,
                      nickname: user.nickname,
                      createdDate: user.createdDate)
        }
    }
    
    func convertBookmarkListUserLikedDTOToModel(_ DTO: DTO.Bookmark.BookmarkListUserLiked) -> [Model.Bookmark] {
        DTO.content.compactMap { post in
            guard let postType = PostType.clientValue(serverValue: post.postType) else {
                // NOTE: 포스트 에러 ! 서버개발자와 논의 !
                return .init(likesId: -1, postId: -1, postType: .tattoo, title: "", imageUrl: "", createdDate: "")
            }
            return .init(likesId: post.likesId,
                         postId: post.postId,
                         postType: postType,
                         title: post.title ?? "",
                         imageUrl: post.imageUrl,
                         createdDate: post.createdDate)
        }
    }
    
    func convertCountOfBookmarkDTOToModel(_ DTO: DTO.Bookmark.CountOfBookmark) -> Model.CountOfBookmark {
        .init(counts: DTO.likesCount)
    }
    
    // MARK: - TattooistProfile
    func convertTattooistIntroduceToModel(_ DTO: DTO.TattooistProfile.Introduce.Response) -> Model.TattooistIntroduce {
        return .init(
            profileId: DTO.profileId,
            introduce: DTO.introduce ?? "",
            userImageUrlString: DTO.userImgUrls?.first,
            userName: DTO.userName,
            addressId: DTO.addressId,
            imageUrlString: DTO.imageUrls.first
        )
    }
    func convertTattooistEstimateToModel(_ DTO: DTO.TattooistProfile.Estimate) -> Model.TattooistEstimate {
        .init(description: DTO.description ?? "")
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
