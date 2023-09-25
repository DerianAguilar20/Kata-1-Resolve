//
//  ListMoviesRouter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 25/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import UIKit

class ListmoviesRouter {
    private var listMoviesView : UIViewController!
    
    func setListmoviesView ( listMoviesView : UIViewController) {
        self.listMoviesView = listMoviesView
    }
    
    func showMoviesViewController ( window : UIWindow) {
        guard let view = listMoviesView else {
            return
        }
        window.rootViewController = view
        window.makeKeyAndVisible()
    }
}
