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
    let moviesListView = MoviesViewController()
    
    func installRootViewControllerintoWindow(window : UIWindow) {
        if let navigationController = window.rootViewController as? UINavigationController {
            if let moviesViewController = navigationController.visibleViewController as? MoviesViewController {
                moviesViewController.injectPresenter(presenter: listMoviePresenter)
            }
        }
    }
    
    func injectRepositoryOnPresenter() {
        listMoviePresenter.injectRepositoryDependency(movieRepository: movieRepositoryDependency)
        //listMoviePresenter.injectListMovieViewDependency(listMovieView: moviesListView)
    }
}
