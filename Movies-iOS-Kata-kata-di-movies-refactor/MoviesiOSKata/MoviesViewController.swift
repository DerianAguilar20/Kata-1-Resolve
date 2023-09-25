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
        DispatchQueue.main.async {
            self.reloadTable()
            self.changeTextLabel(text: "Loading ...")
        }
    }
    
    func loadMovies(movies : [Movie]) {
        DispatchQueue.main.async {
            self.reloadTable()
            self.changeTextLabel(text: "Movies: " + String(movies.count))
        }
    }
}

extension MoviesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let movie : Movie = self.presenter.movies[indexPath.item]
        
        cell.configureCell(data: movie)
        
        return cell
    }
}
