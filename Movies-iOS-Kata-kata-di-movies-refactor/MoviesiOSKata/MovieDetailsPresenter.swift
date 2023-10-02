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
    private var interactor : GetMovieDetailsInteractorInput!
    
    private var title : String!
    
    func setMovieDetailView ( movieDetailsView : MovieDetailsView) {
        self.movieDetailsView = movieDetailsView
    }
    
    func setInteractor ( interactor : GetMovieDetailsInteractorInput) {
        self.interactor = interactor
    }
    
    func setTitle ( title : String) {
        self.title = title
    }
    
    func getMovieDetails () {
        interactor.getMovieDetails(title: title)
    }
}

extension MovieDetailsPresenter : GetMovieDetailsInteractorOutput {
    func showMovieDetails(movie: Movie) {
        movieDetailsView.showMovieDetails(movie: movie)
    }
}
