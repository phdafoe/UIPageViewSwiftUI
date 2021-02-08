//
//  ContentViewModel.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 08/02/2021.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var movies: [Result] = []
    @Published var data = Data()
    
    let interactor: ContentInteractorProtocol = ContentInteractor()
    
    func viewDidLoad(){
        self.interactor.fetchDataFromProvider { [weak self] (resultsData) in
            guard let self = self else { return }
            self.movies = resultsData
        } failure: { (error) in
            print(error)
        }
    }
    
    
    func getImageFromUrl(_ imageUrl : String){
        guard let url = URL(string: imageUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
    
}
