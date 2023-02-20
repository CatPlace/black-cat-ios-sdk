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
        completion: @escaping (Result<Model.StatusOfBookmark, Error>) -> Void
    ) {
        networkService.request(StatusOfBookmarkAPI(postId: postId)) { result in
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
        completion: @escaping (Result<Model.StatusOfBookmark, Error>) -> Void
    ) {
        networkService.request(BookmarkPostAPI(postId: postId)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertStatusOfBookmarkDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 여러개 게시물을 좋아요 하는 함수
    public static func multipleBookmarkPost(
        postIds: [Int],
        completion: @escaping (Result<Model.PostIds, Error>) -> Void
    ) {
        networkService.request(MultipleBookmarkPostAPI(postIds: postIds)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertMultipleBookmarkPostDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 게시물 좋아요 취소 함수
    public static func deleteBookmarkedPost(
        postId: Int,
        completion: @escaping (Result<Model.StatusOfBookmark, Error>) -> Void
    ) {
        networkService.request(DeleteBookmarkedPostAPI(postId: postId)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertStatusOfBookmarkDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 여러개 게시물을 좋아요 취소하는 함수
    public static func multipleBookmarkDelete(
        postIds: [Int],
        completion: @escaping (Result<Model.PostIds, Error>) -> Void
    ) {
        networkService.request(MultipleDeleteBookmarkedPostAPI(postIds: postIds)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertMultipleBookmarkPostDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 게시물을 좋아요한 유저들 조회 함수
    public static func userListInSpecificBookmark(
        postId: Int,
        completion: @escaping (Result<[Model.UserBookmarkPost], Error>) -> Void
    ) {
        networkService.request(UserListInSpecificBookmarkAPI(postId: postId)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertUserListSpecificInBookmarkDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 유저가 좋아요한 게시물들 조회 함수
    public static func bookmarkListInSpecificUser(
        postType: String,
        completion: @escaping (Result<[Model.Bookmark], Error>) -> Void
    ) {
        networkService.request(BookmarkListUserLikedAPI(postType: postType)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertBookmarkListUserLikedDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public static func countBookmark(
        postId: Int,
        completion: @escaping (Result<Model.CountOfBookmark, Error>) -> Void
    ) {
        networkService.request(CountOfBookmarkAPI(postId: postId)) { result in
            switch result {
            case .success(let dto):
                completion(.success(converter.convertCountOfBookmarkDTOToModel(dto)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension Reactive where Base: CatSDKNetworkBookmark {
    /// 특정 게시물이 좋아요가 눌러졌는지 확인하는 함수
    public static func statusOfBookmark(postId: Int) -> Observable<Model.StatusOfBookmark> {
        Base.networkService.rx.request(StatusOfBookmarkAPI(postId: postId))
            .compactMap { Base.converter.convertStatusOfBookmarkDTOToModel($0) }
            .asObservable()
    }
    
    /// 게시물을 좋아요 하는 함수
    public static func bookmarkPost(postId: Int) -> Observable<Model.StatusOfBookmark> {
        Base.networkService.rx.request(BookmarkPostAPI(postId: postId))
            .compactMap { Base.converter.convertStatusOfBookmarkDTOToModel($0) }
            .asObservable()
    }
    
    /// 게시물 좋아요 취소 함수
    public static func deleteBookmarkedPost(postId: Int) -> Observable<Model.StatusOfBookmark> {
        Base.networkService.rx.request(DeleteBookmarkedPostAPI(postId: postId))
            .compactMap { Base.converter.convertStatusOfBookmarkDTOToModel($0) }
            .asObservable()
    }
    
    /// 게시물을 좋아요한 유저들 조회 함수
    public static func userListInSpecificBookmark(postId: Int) -> Observable<[Model.UserBookmarkPost]> {
        Base.networkService.rx.request(UserListInSpecificBookmarkAPI(postId: postId))
            .compactMap { Base.converter.convertUserListSpecificInBookmarkDTOToModel($0) }
            .asObservable()
    }
    
    /// 유저가 좋아요한 게시물들 조회 함수
    public static func bookmarkListInSpecificUser(postType: String) -> Observable<[Model.Bookmark]> {
        Base.networkService.rx.request(BookmarkListUserLikedAPI(postType: postType))
            .compactMap { Base.converter.convertBookmarkListUserLikedDTOToModel($0) }
            .asObservable()
    }
    
    /// 여러개 게시물을 좋아요 취소하는 함수
    public static func multipleBookmarkDelete(postIds: [Int]) -> Observable<Model.PostIds> {
        Base.networkService.rx.request(MultipleDeleteBookmarkedPostAPI(postIds: postIds)).compactMap(Base.converter.convertMultipleBookmarkPostDTOToModel)
            .asObservable()
    }
    
    /// 게시물 수 좋아요 조회 함수
    public static func countOfBookmark(
        postId: Int
    ) -> Observable<Model.CountOfBookmark> {
        Base.networkService.rx.request(CountOfBookmarkAPI(postId: postId))
            .compactMap { Base.converter.convertCountOfBookmarkDTOToModel($0) }
            .asObservable()
    }
}
