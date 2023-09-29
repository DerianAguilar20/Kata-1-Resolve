//
//  MovieDetailsRouter.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 29/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailRouter {
    func presentMovieDetailsView ( viewReference : UIViewController, titleMovie : String)
}

class MovieDetailsRouter : MovieDetailRouter {
    func presentMovieDetailsView ( viewReference : UIViewController, titleMovie : String) {
        let app = AppDependencies()
        let view = app.detailConfig(titleMovie: titleMovie)
        
        viewReference.navigationController?.present(view, animated: true)
    }
}
