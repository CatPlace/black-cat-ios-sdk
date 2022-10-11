//
//  RxCatSDK.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

import RxSwift

public class RxCatSDKMock {
    private init() { }

    private static let networkService = NetworkService()
    private static let converter = DTOtoModelConverter()

    public static func fetchMockDataWithRx() -> Observable<Model.Mock> {
        return NetworkService().requestWithRx(MockAPI())
            .compactMap { DTO in converter.convertMockDTOToMockModel(DTO) } // compactMap으로 인해 DTO에서 혹시나 nil값이 들어있는 프로퍼티들은 생략됩니다.
            .asObservable()
    }
}
