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

    /// 특정 게시물이 좋아요가 눌러졌는지 확인하는 함수
    public static func statusOfBookmark(
        postId: Int,
        userToken: String,
        completion: @escaping (Result<Model.StatusOfBookmark, Error>) -> Void
    ) {
        networkService.request(StatusOfBookmarkPostAPI(postId: postId, token: userToken)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertStatusOfBookmarkDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    /// 게시물을 좋아요 하는 함수
    public static func bookmarkPost(
        postId: Int,
        userToken: String,
        completion: @escaping (Result<Model.StatusOfBookmark, Error>) -> Void
    ) {
        networkService.request(BookmarkPostAPI(postId: postId, token: userToken)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertStatusOfBookmarkDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    /// 게시물 좋아요 취소 함수
    public static func deleteBookmarkedPost(
        postId: Int,
        userToken: String,
        completion: @escaping (Result<Model.StatusOfBookmark, Error>) -> Void
    ) {
        networkService.request(DeleteBookmarkedPostAPI(postId: postId, token: userToken)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertStatusOfBookmarkDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    /// 게시물을 좋아요한 유저들 조회 함수
    public static func userListInSpecificBookmark(
        postId: Int,
        userToken: String,
        completion: @escaping (Result<[Model.UserBookmarkPost], Error>) -> Void
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

    /// 유저가 좋아요한 게시물들 조회 함수
    public static func tattooBookmarkListInSpecificUser(
        userToken: String,
        completion: @escaping (Result<[Model.TattooBookmark], Error>) -> Void
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
}

extension Reactive where Base: CatSDKNetworkBookmark {
    /// 특정 게시물이 좋아요가 눌러졌는지 확인하는 함수
    public static func statusOfBookmark(
        postId: Int,
        userToken: String
    ) -> Observable<Model.StatusOfBookmark> {
        Base.networkService.rx.request(StatusOfBookmarkPostAPI(postId: postId, token: userToken))
            .compactMap { Base.converter.convertStatusOfBookmarkDTOToModel($0) }
            .asObservable()
    }

    /// 게시물을 좋아요 하는 함수
    public static func bookmarkPost(
        postId: Int,
        userToken: String
    ) -> Observable<Model.StatusOfBookmark> {
        Base.networkService.rx.request(BookmarkPostAPI(postId: postId, token: userToken))
            .compactMap { Base.converter.convertStatusOfBookmarkDTOToModel($0) }
            .asObservable()
    }

    /// 게시물 좋아요 취소 함수
    public static func deleteBookmarkedPost(
        postId: Int,
        userToken: String
    ) -> Observable<Model.StatusOfBookmark> {
        Base.networkService.rx.request(DeleteBookmarkedPostAPI(postId: postId, token: userToken))
            .compactMap { Base.converter.convertStatusOfBookmarkDTOToModel($0) }
            .asObservable()
    }

    /// 게시물을 좋아요한 유저들 조회 함수
    public static func userListInSpecificBookmark(
        postId: Int,
        userToken: String
    ) -> Observable<[Model.UserBookmarkPost]> {
        Base.networkService.rx.request(UserListInSpecificBookmarkAPI(postId: postId, token: userToken))
            .compactMap { Base.converter.convertUserListSpecificInBookmarkDTOToModel($0) }
            .asObservable()
    }

    /// 유저가 좋아요한 게시물들 조회 함수
    public static func tattooBookmarkListInSpecificUser(userToken: String) -> Observable<[Model.TattooBookmark]> {
        Base.networkService.rx.request(BookmarkListUserLikedAPI(postType: .tattoo, token: userToken))
            .compactMap { Base.converter.convertBookmarkListUserLikedDTOToModel($0) }
            .asObservable()
    }
}
