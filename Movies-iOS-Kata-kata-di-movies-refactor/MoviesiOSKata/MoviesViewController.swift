//
//  MoviesViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import UIKit

protocol MovieRepositoryProtocol {
    func getMovies() -> [Movie]
}

class MoviesViewController : UIViewController {

    var movieRepository : MovieRepositoryProtocol!
    var movies = [Movie]()
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func refreshClicked(_ sender: UIButton) {
        loadMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesTableView.tableFooterView = UIView()
        moviesTableView.dataSource = self
        
        loadMovies()
    }
    
    func injectRepositoryDependency( movieRepository : MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }
    
    func loadMovies() {
        clearMoviesList()
        reloadTable()
        changeTextLabel(text: "Loading ...")
        
        DispatchQueue.global(qos: .background).async {
            self.movies = self.movieRepository.getMovies()
            
            DispatchQueue.main.async {
                self.reloadTable()
                self.changeTextLabel(text: "Movies: " + String(self.movies.count))
            }
        }
    }
    
    func reloadTable() {
        moviesTableView.reloadData()
    }
    
    func changeTextLabel(text message: String) {
        titleLabel.text = message
    }
    
    func clearMoviesList() {
        movies.removeAll()
    }
}

extension MoviesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let movie : Movie = movies[indexPath.item]
        
        cell.configureCell(data: movie)
        
        return cell
    }
}
