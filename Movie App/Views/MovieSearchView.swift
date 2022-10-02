//
//  MovieSearchView.swift
//  Movie App
//
//  Created by Mikail on 02/10/2022.
//

import SwiftUI

struct MovieSearchView: View {
    @ObservedObject var movieSearchState = MovieSearchState()
    var body: some View {
        NavigationView {
            List{
                SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                LoadingView(isLoading: self.movieSearchState.isLoasding, error: self.movieSearchState.error) {
                    self.movieSearchState.query
                }
                
                if self.movieSearchState.movies != nil{
                    ForEach(self.movieSearchState.movies!){ movie in
                        NavigationLink {
                            MovieDetailView(movieId: movie.id)
                        } label: {
                            VStack(alignment:.leading) {
                                Text(movie.title)
                                Text(movie.yearText)
                            }
                        }

                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Search")
        }
        .onAppear{
            self.movieSearchState.startObserve()
        }
       
       
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
