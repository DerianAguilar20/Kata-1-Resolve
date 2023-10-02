//
//  MovieDetailsInteractor.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 29/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import Foundation

protocol GetMovieDetailsInteractorOutput {
    func showMovieDetails ( movie : Movie)
}

protocol GetMovieDetailsInteractorInput {
    func getMovieDetails ( title : String)
}

class GetMovieDetailsInteractor : GetMovieDetailsInteractorInput {
    private var movieRepository : MovieRepository!
    private var presenter : GetMovieDetailsInteractorOutput!
    
    func setMovieRepository ( movieRepository : MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func setPresenter ( presenter : GetMovieDetailsInteractorOutput) {
        self.presenter = presenter
    }
    
    func getMovieDetails(title: String) {
        DispatchQueue.global(qos: .background).async {
            let movie = self.movieRepository.getMovieDetails(title: title)
            DispatchQueue.main.async {
                self.presenter.showMovieDetails(movie: movie)
            }
        }
    }
}
