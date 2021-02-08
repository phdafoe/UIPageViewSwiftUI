//
//  ContentViewModel.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 08/02/2021.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var movies: [Result] = []
    
    let interactor: ContentInteractorProtocol = ContentInteractor()
    
    func viewDidLoad(){
        self.interactor.fetchDataFromProvider { [weak self] (resultsData) in
            guard self != nil else { return }
            self?.movies = resultsData
        } failure: { (error) in
            print(error)
        }

    }
    
}
