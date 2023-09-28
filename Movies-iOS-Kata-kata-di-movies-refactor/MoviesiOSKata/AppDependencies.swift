//
//  AppDependencies.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 15/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import UIKit

class ApDependencies {
    let movieRepositoryDependency = DiskMovieRepository()
    let listMoviePresenter = ListMoviePresenter()
    let listMoviesInteractor = GetListMoviesInteractor()
    var listMoviesView : ListMoviesView!
    
    func configureDependencies (window : UIWindow) {
        injectDependenciesInteractor()
        injectDependenciesListMoviesView(window: window)
        injectDependenciesPresenter()
    }
    
    func injectDependenciesListMoviesView(window : UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController {
            if let moviesViewController = navigationController.visibleViewController as? MoviesViewController {
                listMoviesView = moviesViewController
                moviesViewController.setPresenter(presenter: listMoviePresenter)
            }
        }
    }
        
    func injectDependenciesPresenter () {
        listMoviePresenter.setListMovieInteractor(listMovieInteractor: listMoviesInteractor)
        listMoviePresenter.setListMoviesView(listMoviesView: listMoviesView)
    }
    
    func injectDependenciesInteractor () {
        listMoviesInteractor.setMovieRepository(movieRepository: movieRepositoryDependency)
        listMoviesInteractor.setPresenter(presenter: listMoviePresenter)
    }
}

class AppDependencies {
    let movieRepositoryDependency = DiskMovieRepository()
    let listMoviePresenter = ListMoviePresenter()
    let listMoviesInteractor = GetListMoviesInteractor()
    
    func configureDependencies (window : UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController {
            if let moviesViewController = navigationController.visibleViewController as? MoviesViewController {
                injectDependenciesInteractor()
                injectDependenciesPresenter(view: moviesViewController)
                injectDependenciesListMoviesView(view: moviesViewController)
            }
        }
    }
    
    func injectDependenciesListMoviesView( view : MoviesViewController) {
        view.setPresenter(presenter: listMoviePresenter)
    }
        
    func injectDependenciesPresenter ( view : ListMoviesView) {
        listMoviePresenter.setListMovieInteractor(listMovieInteractor: listMoviesInteractor)
        listMoviePresenter.setListMoviesView(listMoviesView: view)
    }
    
    func injectDependenciesInteractor () {
        listMoviesInteractor.setMovieRepository(movieRepository: movieRepositoryDependency)
        listMoviesInteractor.setPresenter(presenter: listMoviePresenter)
    }
}
