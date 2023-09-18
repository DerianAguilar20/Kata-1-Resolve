//
//  AppDependencies.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 15/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import UIKit

class AppDependencies {
    func installRootViewControllerintoWindow(window : UIWindow) {
        let movieRepositoryDependency = DiskMovieRepository()
        
        if let navigationController = window.rootViewController as? UINavigationController {
            if let moviesViewController = navigationController.visibleViewController as? MoviesViewController {
                moviesViewController.injectRepositoryDependency(movieRepository: movieRepositoryDependency)
            }
        }
    }
}
