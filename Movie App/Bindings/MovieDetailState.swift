//
//  MovieDetailState.swift
//  Movie App
//
//  Created by Mikail on 01/10/2022.
//

import Foundation
class MovieDetailState:ObservableObject{
    
    private let movieService:MovieService
    @Published var movie:Movie?
    @Published var isLoading = false
    @Published var error: NSError?
    
    init(movieService:MovieService = MovieStore.shared){
        self.movieService = movieService
    }
    
    func loadMovie(id:Int){
        self.movie = nil
        self.isLoading = false
        
        print("Fetching movie wityh id \(id)")
        self.movieService.fetchMovie(id: id) { [weak self] (result) in
            guard let self = self else {return}
            
            self.isLoading = false
            switch result{
                case .success(let movie):
                print("Success in getting movie \(movie)")
                self.movie = movie
                 case .failure(let error):
                print("Error in getting movie")
                self.error = error as NSError
            }
            
        }
    }
    
    
}
