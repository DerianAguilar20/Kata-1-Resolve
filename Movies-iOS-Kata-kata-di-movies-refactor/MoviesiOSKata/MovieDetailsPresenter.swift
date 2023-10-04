//
//  MovieDetailsPresenter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 29/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

protocol MovieDetailsView {
    func showMovieDetails ( movie : Movie)
}

class MovieDetailsPresenter {
    private var movieDetailsView : MovieDetailsView!
    
    private var movie : Movie!
    
    func setMovieDetailView ( movieDetailsView : MovieDetailsView) {
        self.movieDetailsView = movieDetailsView
    }
    
    func setMovie ( movie : Movie) {
        self.movie = movie
    }
    
    func getMovieDetails () {
        movieDetailsView.showMovieDetails(movie: movie)
    }
}
