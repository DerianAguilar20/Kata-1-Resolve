//
//  ListMoviesRouter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 25/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import UIKit

protocol ListMoviesRouter {
    func showMoviesListView ( viewControllerReference : UIViewController)
}

class ListmoviesRouter : ListMoviesRouter {
    private var listMoviesView : UIViewController!
    
    func setListmoviesView ( listMoviesView : UIViewController) {
        self.listMoviesView = listMoviesView
    }
    
    func showMoviesListView ( viewControllerReference : UIViewController) {
        viewControllerReference.navigationController?.present(self.listMoviesView, animated: true)
    }
}
