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

protocol ListMoviesView : AnyObject {
    func refresh ()
    func loadMovies ()
}

class ListMoviePresenter {
    weak var listMoviesView : ListMoviesView?
    var movieRepository : MovieRepository!
    
    var movies = [Movie]()
    
    func injectRepositoryDependency( movieRepository : MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    /*func injectListMovieViewDependency( listMovieView : ListMoviesView ) {
        self.listMoviesView = listMovieView
    }*/
    
    func viewDidLoad () {
        refreshListMovies()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.listMovies()
        }
    }
    
    func listMovies () {
        movies = self.movieRepository.getMovies()
        listMoviesView?.loadMovies()
    }
    
    func refreshListMovies () {
        movies.removeAll()
        listMoviesView?.refresh()
    }
}
