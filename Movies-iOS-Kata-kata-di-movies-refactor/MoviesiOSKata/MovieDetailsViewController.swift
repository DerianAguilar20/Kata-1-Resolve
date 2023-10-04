//
//  MovieDetailsViewController.swift
//  MoviesiOSKata
//
//  Created by Derian Aguilar on 29/09/23.
//  Copyright © 2023 xurxodev. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private var presenter : MovieDetailsPresenter!

    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getMovieDetails()
    }
    
    func setPresenter ( presenter : MovieDetailsPresenter) {
        self.presenter = presenter
    }
}

extension MovieDetailsViewController : MovieDetailsView {
    func showMovieDetails(movie: Movie) {
        nameMovie.text = movie.title
        imageMovie.load(url: URL(string: movie.image!)!)
    }
}
