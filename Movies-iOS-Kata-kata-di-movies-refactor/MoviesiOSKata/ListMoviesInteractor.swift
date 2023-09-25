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
}

protocol NotifyPresenter {
    func showListMovies( movies : [Movie])
}

protocol ListMovieInteractor {
    func getListMovies()
}

class ListMoviesInteractor : ListMovieInteractor {
    private var movieRepository : MovieRepository!
    private var presenter : NotifyPresenter!
    
    func setMovieRepository( movieRepository : MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func setPresenter( presenter : NotifyPresenter) {
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
