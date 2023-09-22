//
//  ListMoviePresenter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 21/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import Foundation

protocol MovieRepository {
    func getMovies() -> [Movie]
}

protocol ListMoviesView {
    func refresh ()
    func loadMovies (movies : [Movie])
}

class ListMoviePresenter {
    private var listMoviesView : ListMoviesView!
    var movieRepository : MovieRepository!
    
    var movies = [Movie]()
    
    func injectRepositoryDependency( movieRepository : MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func injectListMovieViewDependency( listMovieView : ListMoviesView ) {
        self.listMoviesView = listMovieView
    }
    
    func viewDidLoad () {
        refreshListMovies()
        listMovies()
    }
    
    func listMovies () {
        DispatchQueue.global(qos: .background).async {
            self.movies = self.movieRepository.getMovies()
            
            DispatchQueue.main.async {
                self.listMoviesView?.loadMovies(movies : self.movies)
            }
        }
    }
    
    func refreshListMovies () {
        movies.removeAll()
        listMoviesView?.refresh()
    }
}
