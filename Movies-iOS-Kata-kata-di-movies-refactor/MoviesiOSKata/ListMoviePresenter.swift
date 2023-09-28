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

class ListMoviePresenter {
    private var listMoviesView : ListMoviesView?
    private var getListMovieInteractor : GetListMovieInteractorInput!
    
    var movies = [Movie]()
    
    func setListMovieInteractor( listMovieInteractor : GetListMovieInteractorInput ) {
        self.getListMovieInteractor = listMovieInteractor
    }
    
    func setListMoviesView( listMoviesView : ListMoviesView) {
        self.listMoviesView = listMoviesView
    }
    
    func reloadMovies () {
        refreshListMovies()
        getListMovies()
    }
    
    func getListMovies () {
        getListMovieInteractor.getListMovies()
    }
    
    func refreshListMovies () {
        movies.removeAll()
        listMoviesView?.refresh()
    }
}

extension ListMoviePresenter  : GetListMovieInteractorOutput {
    func showListMovies(movies: [Movie]) {
        self.movies = movies
        listMoviesView?.loadMovies(movies: movies)
    }
}
