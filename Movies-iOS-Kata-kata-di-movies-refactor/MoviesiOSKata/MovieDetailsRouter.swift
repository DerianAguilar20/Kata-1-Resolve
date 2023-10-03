//
//  MovieDetailsRouter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 29/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import UIKit

protocol MovieDetailRouter {
    func presentMovieDetailsView ( viewReference : UIViewController, titleMovie : String)
}

class MovieDetailsRouter : MovieDetailRouter {
    private var appDependencies : AppDependencies!
    
    func setAppDependencies ( appDependencies : AppDependencies) {
        self.appDependencies = appDependencies
    }
    
    func presentMovieDetailsView ( viewReference : UIViewController, titleMovie : String) {
        let viewDetails = appDependencies.configMovieDetailModul(titleMovie: titleMovie)
        
        presentView( view : viewDetails, viewRef : viewReference)
    }
    
    func presentView( view : MovieDetailsViewController, viewRef : UIViewController) {
        viewRef.navigationController?.present(view, animated: true)
    }
}
