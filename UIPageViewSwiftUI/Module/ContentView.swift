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
                List{
                    ForEach(self.viewModel.movies) { movie in
                        CellOverlay(movie: movie)
                    }
                }
            }
        }.onAppear{
            self.viewModel.viewDidLoad()
        }
    }
    
}

struct CellOverlay: View {
    
    var movie: Result
    @ObservedObject var viewModel = ContentViewModel()
    
    init(movie: Result) {
        self.movie = movie
        self.viewModel.getImageFromUrl(movie.artworkUrl100 ?? "")
    }
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.8), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .top)
    }
    
    var body: some View {
            ZStack(alignment: .bottomLeading) {
                Image(uiImage: ((self.viewModel.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.viewModel.data))!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Rectangle().fill(gradient)
                VStack(alignment: .leading) {
                    Text(movie.name ?? "")
                        .font(.title)
                        .bold()
                    Text(movie.kind ?? "")
                }
                .padding()
            }
            .foregroundColor(.white)
        }
}
