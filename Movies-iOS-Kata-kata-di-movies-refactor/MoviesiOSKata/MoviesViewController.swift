//
//  MoviesViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import UIKit

class MoviesViewController : UIViewController {
    
    private var presenter : ListMoviePresenter!
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesTableView.tableFooterView = UIView()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
        presenter.reloadMovies()
    }
    
    func setPresenter( presenter : ListMoviePresenter) {
        self.presenter = presenter
    }
    
    @IBAction func refreshClicked(_ sender: UIButton) {
        presenter.reloadMovies()
    }
    
    func reloadTable() {
        moviesTableView.reloadData()
    }
    
    func changeTextLabel(text message: String) {
        titleLabel.text = message
    }
}

extension MoviesViewController : ListMoviesView {
    func refresh() {
        reloadTable()
        changeTextLabel(text: "Loading ...")
    }
    
    func loadMovies(movies : [Movie]) {
        reloadTable()
        changeTextLabel(text: "Movies: " + String(movies.count))
    }
}

extension MoviesViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let movie : Movie = self.presenter.movies[indexPath.item]
        
        cell.configureCell(data: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.presentDetailMovie(index: indexPath.row)
    }
}
