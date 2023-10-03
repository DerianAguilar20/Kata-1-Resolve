//
//  ListMoviesRouter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 29/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import UIKit

class ListMoviesRouter : ListMovieRouter {
    private var listMoviesView : ListMoviesView!
    private var movieDetailsRouter : MovieDetailRouter!
    
    func setMovieDetailsRouter ( movieDetailsRouter : MovieDetailRouter) {
        self.movieDetailsRouter = movieDetailsRouter
    }
    
    func setListMoviesView ( listMoviesView : ListMoviesView) {
        self.listMoviesView = listMoviesView
    }
    
    func presentMovieDetailsView ( titleMovie : String) {
        movieDetailsRouter.presentMovieDetailsView(viewReference: listMoviesView as! UIViewController, titleMovie: titleMovie)
    }
}
