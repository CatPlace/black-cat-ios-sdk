//
//  CatSDKNetworkBookmark.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

import RxSwift

public class CatSDKNetworkBookmark: CatSDKNetworkable {
    private init() {}

    public static func tattooBookmarkListInSpecificUser(
        userToken: String,
        completion: @escaping (Result<[Model.TattooBookmarkModel], Error>) -> Void
    ) {
        networkService.request(BookmarkListUserLikedAPI(postType: .tattoo, token: userToken)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertBookmarkListUserLikedDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public static func userListInSpecificBookmark(
        postId: Int,
        userToken: String,
        completion: @escaping (Result<[Model.UserBookmarkPostModel], Error>) -> Void
    ) {
        networkService.request(UserListInSpecificBookmarkAPI(postId: postId, token: userToken)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertUserListSpecificInBookmarkDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public static func deleteBookmarkedPost(
        postId: Int,
        userToken: String,
        completion: @escaping (Result<Model.DeleteBookmarkedPostModel, Error>) -> Void
    ) {
        networkService.request(DeleteBookmarkedPostAPI(postId: postId, token: userToken)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertDeleteBookmarkedPostDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public static func bookmarkPost(
        postId: Int,
        userToken: String,
        completion: @escaping (Result<Model.DeleteBookmarkedPostModel, Error>) -> Void
    ) {
        networkService.request(BookmarkPostAPI(postId: postId, token: userToken)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertDeleteBookmarkedPostDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkBookmark {
    public static func tattooBookmarkListInSpecificUser(userToken: String) -> Observable<[Model.TattooBookmarkModel]> {
        Base.networkService.rx.request(BookmarkListUserLikedAPI(postType: .tattoo, token: userToken))
            .compactMap { Base.converter.convertBookmarkListUserLikedDTOToModel($0) }
            .asObservable()
    }

    public static func userListInSpecificBookmark(
        postId: Int,
        userToken: String
    ) -> Observable<[Model.UserBookmarkPostModel]> {
        Base.networkService.rx.request(UserListInSpecificBookmarkAPI(postId: postId, token: userToken))
            .compactMap { Base.converter.convertUserListSpecificInBookmarkDTOToModel($0) }
            .asObservable()
    }

    public static func deleteBookmarkedPost(
        postId: Int,
        userToken: String
    ) -> Observable<Model.DeleteBookmarkedPostModel> {
        Base.networkService.rx.request(DeleteBookmarkedPostAPI(postId: postId, token: userToken))
            .compactMap { Base.converter.convertDeleteBookmarkedPostDTOToModel($0) }
            .asObservable()
    }

    public static func bookmarkPost(
        postId: Int,
        userToken: String
    ) -> Observable<Model.DeleteBookmarkedPostModel> {
        Base.networkService.rx.request(BookmarkPostAPI(postId: postId, token: userToken))
            .compactMap { Base.converter.convertDeleteBookmarkedPostDTOToModel($0) }
            .asObservable()
    }
}
