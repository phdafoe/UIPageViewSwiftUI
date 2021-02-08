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
    
    func ViewDidLoad(){
        
    }
    
}
