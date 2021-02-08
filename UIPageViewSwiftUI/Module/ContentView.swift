//
//  ContentView.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 07/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        HStack {
            if !self.viewModel.movies.isEmpty{
                Text(self.viewModel.movies[0].artistName!)
            }
        }.onAppear{
            self.viewModel.viewDidLoad()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12 mini")
    }
}
