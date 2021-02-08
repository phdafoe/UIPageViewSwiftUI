//
//  ContentProvider.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 08/02/2021.
//

import Foundation

protocol ContentProviderProtocolo: class {
    func fetchDataFromBaseProvider(completionHandler: @escaping(Movies) -> (), failure: @escaping(APIError) -> ())
}

class ContentProvider: ContentProviderProtocolo {
    
    let baseProvider: GenericProviderProtocol = GenericProvider()
    
    internal func fetchDataFromBaseProvider(completionHandler: @escaping(Movies) -> (), failure: @escaping(APIError) -> ()) {
        
        self.baseProvider.getMoviesProvider { [weak self] (result) in
            guard self != nil else { return }
            completionHandler(result)
        } failure: { (error) in
            failure(error)
        }

    }
}
