//
//  ListMoviesRouter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 29/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import Foundation
import UIKit

protocol ListMovieRouter {
    func presentMovieDetailsView ( titleMovie : String)
}

class ListMoviesRouter : ListMovieRouter {
    private var listMoviesView : UIViewController!
    private let movieDetailsRouter = MovieDetailsRouter()
    
    func setListMoviesView ( listMoviesView : UIViewController) {
        self.listMoviesView = listMoviesView
    }
    
    func presentMovieDetailsView ( titleMovie : String) {
        movieDetailsRouter.presentMovieDetailsView(viewReference: listMoviesView, titleMovie: titleMovie)
    }
}
