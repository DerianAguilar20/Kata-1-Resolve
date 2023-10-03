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
    let listMoviesInteractor = GetListMoviesInteractor()
    let listMoviesRouter = ListMoviesRouter()
    
    let movieDetailsRouter = MovieDetailsRouter()
    var movieDetailsView : MovieDetailsViewController!
    var movieDetailsPresenter : MovieDetailsPresenter!
    
    func configureInitialDependencies (window : UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController {
            if let moviesViewController = navigationController.visibleViewController as? MoviesViewController {
                injectDependenciesInteractor()
                injectDependenciesPresenter(view: moviesViewController)
                injectDependenciesListMoviesView(view: moviesViewController)
                injectDependenciesRouterDetail()
                injectDependenciesRouter(view: moviesViewController)
            }
        }
    }
    
    func injectDependenciesListMoviesView( view : MoviesViewController) {
        view.setPresenter(presenter: listMoviePresenter)
    }
        
    func injectDependenciesPresenter ( view : ListMoviesView) {
        listMoviePresenter.setListMovieInteractor(listMovieInteractor: listMoviesInteractor)
        listMoviePresenter.setListMoviesView(listMoviesView: view)
        listMoviePresenter.setListMovieRouter(listMoviesRouter: listMoviesRouter)
    }
    
    func injectDependenciesInteractor () {
        listMoviesInteractor.setMovieRepository(movieRepository: movieRepositoryDependency)
        listMoviesInteractor.setPresenter(presenter: listMoviePresenter)
    }
    
    func injectDependenciesRouter ( view : ListMoviesView) {
        listMoviesRouter.setListMoviesView(listMoviesView: view)
        listMoviesRouter.setMovieDetailsRouter(movieDetailsRouter: movieDetailsRouter)
    }
    
    func configMovieDetailModul(movie : Movie) -> MovieDetailsViewController {
        instanceClassDetailModul()
        
        configClassModulDetail(movie: movie)
        
        return movieDetailsView
    }
    
    func instanceClassDetailModul () {
        movieDetailsView = MovieDetailsViewController()
        movieDetailsPresenter = MovieDetailsPresenter()
    }
    
    func configClassModulDetail ( movie : Movie) {
        injectDependenciesDetailPresenter(movie: movie)
        injectDependenciesDetailView()
    }
    
    func injectDependenciesDetailPresenter( movie : Movie) {
        movieDetailsPresenter.setMovieDetailView(movieDetailsView: movieDetailsView)
        movieDetailsPresenter.setTitle(movie: movie)
    }
    
    func injectDependenciesDetailView() {
        movieDetailsView.setPresenter(presenter: movieDetailsPresenter)
    }
    
    func injectDependenciesRouterDetail () {
        movieDetailsRouter.setAppDependencies(appDependencies: self)
    }
}
