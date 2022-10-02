//
//  MovieList.swift
//  Movie App
//
//  Created by Mikail on 01/10/2022.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    
    var body: some View {
        NavigationView{
            List{
                Group{
                    if nowPlayingState.movies != nil{
                        MoviePosterCarouselView(title: "Now Playing", movies: nowPlayingState.movies!)
                    }else{
                        LoadingView(isLoading: nowPlayingState.isLoading, error: nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                    
                }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                

                Group{
                    if upcomingState.movies != nil{
                        MovieBackdropCarouselView(title: "Upcoming", movies: upcomingState.movies!)
                    }else{
                        LoadingView(isLoading: upcomingState.isLoading, error: upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }.listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
             
                
                Group{
                    if topRatedState.movies != nil{
                        MovieBackdropCarouselView(title: "Top Rated", movies: topRatedState.movies!)
                    }else{
                        LoadingView(isLoading: topRatedState.isLoading, error: topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                    
                }.listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
             
                Group{
                    if popularState.movies != nil{
                        MovieBackdropCarouselView(title: "Popular", movies: topRatedState.movies!)
                    }else{
                        LoadingView(isLoading: popularState.isLoading, error: popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }.listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
             
            }
            .listStyle(PlainListStyle())
            .navigationTitle("The MoviesDb")
            
        }
        .onAppear{
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
