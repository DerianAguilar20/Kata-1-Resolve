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
    var movieDetailsInteractor : GetMovieDetailsInteractor!
    
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
    
    func injectDependenciesRouter ( view : UIViewController) {
        listMoviesRouter.setListMoviesView(listMoviesView: view)
        listMoviesRouter.setMovieDetailsRouter(movieDetailsRouter: movieDetailsRouter)
    }
    
    func configMovieDetailModul(titleMovie : String) -> MovieDetailsViewController {
        instanceClassDetailModul()
        
        configClassModulDetail(titleMovie: titleMovie)
        
        return movieDetailsView
    }
    
    func instanceClassDetailModul () {
        movieDetailsView = MovieDetailsViewController()
        movieDetailsPresenter = MovieDetailsPresenter()
        movieDetailsInteractor = GetMovieDetailsInteractor()
    }
    
    func configClassModulDetail (titleMovie : String) {
        injectDependenciesDetailInteractor()
        injectDependenciesDetailPresenter(titleMovie: titleMovie)
        injectDependenciesDetailView()
    }
    
    func injectDependenciesDetailInteractor() {
        movieDetailsInteractor.setMovieRepository(movieRepository: movieRepositoryDependency)
        movieDetailsInteractor.setPresenter(presenter: movieDetailsPresenter)
    }
    
    func injectDependenciesDetailPresenter(titleMovie : String) {
        movieDetailsPresenter.setInteractor(interactor: movieDetailsInteractor)
        movieDetailsPresenter.setMovieDetailView(movieDetailsView: movieDetailsView)
        movieDetailsPresenter.setTitle(title: titleMovie)
    }
    
    func injectDependenciesDetailView() {
        movieDetailsView.setPresenter(presenter: movieDetailsPresenter)
    }
    
    func injectDependenciesRouterDetail () {
        movieDetailsRouter.setAppDependencies(appDependencies: self)
    }
}
