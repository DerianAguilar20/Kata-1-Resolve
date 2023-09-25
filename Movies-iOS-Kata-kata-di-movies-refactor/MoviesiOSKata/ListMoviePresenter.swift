//
//  ListMoviePresenter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 21/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import Foundation

protocol ListMoviesView {
    func refresh ()
    func loadMovies (movies : [Movie])
}

class ListMoviePresenter : NotifyPresenter {
    private var listMoviesView : ListMoviesView!
    private var listMovieInteractor : ListMovieInteractor!
    
    var movies = [Movie]()
    
    func setListMovieView( listMovieView : ListMoviesView ) {
        self.listMoviesView = listMovieView
    }
    
    func setListMovieInteractor( listMovieInteractor : ListMovieInteractor ) {
        self.listMovieInteractor = listMovieInteractor
    }
    
    func reloadMovies () {
        refreshListMovies()
        getListMovies()
    }
    
    func getListMovies () {
        self.listMovieInteractor.getListMovies()
    }
    
    func refreshListMovies () {
        movies.removeAll()
        listMoviesView?.refresh()
    }
    
    func showListMovies(movies: [Movie]) {
        self.movies = movies
        listMoviesView.loadMovies(movies: movies)
    }
}
