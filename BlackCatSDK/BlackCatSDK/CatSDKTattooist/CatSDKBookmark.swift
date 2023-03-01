//
//  CatSDKBookmark.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/19.
//

import Foundation
import RxSwift

public enum PostType: Int, CaseIterable {
    case tattoo
    case tattooist
    
    func serverValue() -> String {
        switch self {
        case .tattoo: return "TATTOO"
        case .tattooist: return "PROFILE"
        }
    }
    
    static func clientValue(serverValue: String) -> PostType? {
        switch serverValue {
        case "TATTOO": return .tattoo
        case "PROFILE": return .tattooist
        default: return nil
        }
    }
    
    public func asKorean() -> String {
        switch self {
        case .tattoo: return "타투"
        case .tattooist: return "타투이스트"
        }
    }
}

public class CatSDKBookmark {
    public static func bookmarkListInSpecificUser(postType: PostType) -> Observable<[Model.Bookmark]> {
        CatSDKNetworkBookmark.rx.bookmarkListInSpecificUser(postType: postType.serverValue())
    }
    
    public static func deleteBookmark(with indexList: [Int]) -> Observable<Model.PostIds> {
        CatSDKNetworkBookmark.rx.multipleBookmarkDelete(postIds: indexList)
            .catch { _ in .just(.init(postIds: [-1])) }
    }
    
    public static func isBookmarked(postId: Int) -> Observable<Bool> {
        CatSDKNetworkBookmark.rx.statusOfBookmark(postId: postId).map { $0.liked }
    }
}

