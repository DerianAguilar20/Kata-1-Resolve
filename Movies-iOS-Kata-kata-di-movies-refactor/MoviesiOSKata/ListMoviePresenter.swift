//
//  ListMoviePresenter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 21/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//


protocol ListMoviesView {
    func refresh ()
    func loadMovies (movies : [Movie])
}

protocol ListMovieRouter {
    func presentMovieDetailsView ( movie : Movie)
}

class ListMoviePresenter {
    private var listMoviesView : ListMoviesView!
    private var getListMovieInteractor : GetListMovieInteractorInput!
    private var listMoviesRouter : ListMovieRouter!
    
    var movies = [Movie]()
    
    func setListMovieInteractor( listMovieInteractor : GetListMovieInteractorInput ) {
        self.getListMovieInteractor = listMovieInteractor
    }
    
    func setListMoviesView( listMoviesView : ListMoviesView) {
        self.listMoviesView = listMoviesView
    }
    
    func setListMovieRouter ( listMoviesRouter : ListMovieRouter) {
        self.listMoviesRouter = listMoviesRouter
    }
    
    func presentDetailMovie ( index : Int) {
        let movie = getMovie(index: index)
        presentMovieDetail(movie: movie)
    }
    
    func presentMovieDetail ( movie : Movie) {
        listMoviesRouter.presentMovieDetailsView(movie: movie)
    }
    
    func getMovie ( index : Int) -> Movie {
        movies[index]
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
