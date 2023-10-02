//
//  ListMoviesInteractor.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 25/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import Foundation

protocol MovieRepository {
    func getMovies() -> [Movie]
    func getMovieDetails( title : String) -> Movie
}

protocol GetListMovieInteractorOutput {
    func showListMovies( movies : [Movie])
}

protocol GetListMovieInteractorInput {
    func getListMovies()
}

class GetListMoviesInteractor : GetListMovieInteractorInput {
    private var movieRepository : MovieRepository!
    private var presenter : GetListMovieInteractorOutput!
    
    func setMovieRepository( movieRepository : MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func setPresenter( presenter : GetListMovieInteractorOutput) {
        self.presenter = presenter
    }
    
    func getListMovies() {
        DispatchQueue.global(qos: .background).async {
           let movies = self.movieRepository.getMovies()
            DispatchQueue.main.async {
                self.presenter.showListMovies(movies: movies)
            }
        }
    }
}
