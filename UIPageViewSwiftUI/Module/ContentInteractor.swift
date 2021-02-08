//
//  ContentInteractor.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 08/02/2021.
//

import Foundation

protocol ContentInteractorProtocol: class {
    func fetchDataFromProvider(completionHandler: @escaping([Result]) -> (), failure: @escaping(String) -> ())
}

class ContentInteractor: ContentInteractorProtocol {
    
    let provider: ContentProviderProtocolo = ContentProvider() 
    
    internal func fetchDataFromProvider(completionHandler: @escaping([Result]) -> (), failure: @escaping(String) -> ()) {
        self.provider.fetchDataFromBaseProvider { [weak self] (result) in
            guard self != nil else { return }
            guard let resultsDes = result.feed?.results else { return }
            completionHandler(resultsDes)
        } failure: { (error) in
            failure(error.localizedDescription)
        }
    }
    
}
