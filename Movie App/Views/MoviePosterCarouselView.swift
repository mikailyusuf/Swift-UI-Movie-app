//
//  MoviePosterCarouselView.swift
//  Movie App
//
//  Created by Mikail on 01/10/2022.
//

import SwiftUI

struct MoviePosterCarouselView: View {
    let title:String
    let movies:[Movie]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 16){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment:.top,spacing: 16){
                    ForEach(self.movies) { movie in
                        NavigationLink(destination:
                            MovieDetailView(movieId: movie.id)) {
                            MovieBackDropCard(movie: movie)
                                .frame(width: 272,height: 200)
                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarouselView(title: "Now Playing", movies: Movie.stubbedMovies)
    }
}