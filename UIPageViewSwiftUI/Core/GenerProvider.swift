//
//  GenericProvider.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 08/02/2021.
//

import Foundation

protocol GenericProviderProtocol: class {
    func getMoviesProvider(success: @escaping(Movies) -> (), failure: @escaping(APIError) -> ())
}


class GenericProvider: BaseProvider, GenericProviderProtocol {
    
    internal func getMoviesProvider(success: @escaping(Movies) -> (), failure: @escaping(APIError) -> ()) {
        requestGeneric(Movies.self, endpoint: CONSTANTS.BASE_URL.BASE_URL_MOVIE)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        failure(error)
                }
            }) { (data) in
                success(data)
            }.cancel()
    }
}
