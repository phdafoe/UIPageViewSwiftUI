//
//  GenericProvider.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 08/02/2021.
//

import Foundation
import Combine

protocol GenericProviderProtocol: class {
    func getMoviesProvider(success: @escaping(Movies) -> (), failure: @escaping(APIError) -> ())
}


class GenericProvider: BaseProvider, GenericProviderProtocol {
    
    var cancellables = Set<AnyCancellable>()
    
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
            }.store(in: &cancellables)
    }
}
