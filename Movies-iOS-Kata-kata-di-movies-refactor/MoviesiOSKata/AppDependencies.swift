//
//  AppDependencies.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 15/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import UIKit

class AppDependencies {
    let movieRepositoryDependency = DiskMovieRepository()
    let listMoviePresenter = ListMoviePresenter()
    let listMoviesInteractor = ListMoviesInteractor()
    let listMoviesRouter = ListmoviesRouter()
    
    func installRootViewControllerintoWindow(window : UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController {
            if let moviesViewController = navigationController.visibleViewController as? MoviesViewController {
                listMoviesRouter.setListmoviesView(listMoviesView: moviesViewController)
                
                moviesViewController.setPresenter(presenter: listMoviePresenter)
                
                listMoviesInteractor.setMovieRepository(movieRepository: movieRepositoryDependency)
                listMoviesInteractor.setPresenter(presenter: listMoviePresenter)
                
                listMoviePresenter.setListMovieInteractor(listMovieInteractor: listMoviesInteractor)
                listMoviePresenter.setListMovieView(listMovieView: moviesViewController)
            }
        }
    }
}
