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
    
    // Modulo Listar Peliculas
    
    func configureDependenciesListMoviesModul (window : UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController {
            if let moviesViewController = navigationController.visibleViewController as? MoviesViewController {
                injectDependenciesInteractor()
                injectDependenciesPresenter(view: moviesViewController)
                injectDependenciesListMoviesView(view: moviesViewController)
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
    
    // Modulo Detalle
    
    var view : MovieDetailsViewController!
    var presenter : MovieDetailsPresenter!
    var interactor : GetMovieDetailsInteractor!
    
    func detailConfig(titleMovie : String) -> MovieDetailsViewController {
        view = MovieDetailsViewController()
        presenter = MovieDetailsPresenter()
        interactor = GetMovieDetailsInteractor()
        
        injectDependenciesModulDetail(presenter: presenter, interactor: interactor, view: view, titleMovie: titleMovie)
        
        return view
    }
    
    func injectDependenciesModulDetail (presenter : MovieDetailsPresenter, interactor : GetMovieDetailsInteractor, view : MovieDetailsViewController, titleMovie : String) {
        injectDependenciesDetailInteractor(presenter: presenter)
        injectDependenciesDetailPresenter(view: view, interactor: interactor, titleMovie: titleMovie)
        injectDependenciesDetailView(presenter: presenter)
    }
    
    func injectDependenciesDetailInteractor(presenter: MovieDetailsPresenter) {
        interactor.setMovieRepository(movieRepository: movieRepositoryDependency)
        interactor.setPresenter(presenter: presenter)
    }
    
    func injectDependenciesDetailPresenter(view: MovieDetailsViewController, interactor: GetMovieDetailsInteractor, titleMovie : String) {
        presenter.setInteractor(interactor: interactor)
        presenter.setMovieDetailView(movieDetailsView: view)
        presenter.setTitle(title: titleMovie)
    }
    
    func injectDependenciesDetailView(presenter: MovieDetailsPresenter) {
        view.setPresenter(presenter: presenter)
    }
}
