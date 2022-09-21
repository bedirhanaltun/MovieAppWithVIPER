//
//  View.swift
//  MovieAppWithVIPER
//
//  Created by Bedirhan Altun on 21.09.2022.
//

import Foundation
import UIKit

protocol AnyView{
    var presenter: AnyPresenter? {get set}
    
    func update(with movies: SearchMovie)
    func update(with error: String)
}

class MovieViewController: UIViewController,AnyView,UITableViewDelegate,UITableViewDataSource{
    
    
    var presenter: AnyPresenter?
    var moviesList: SearchMovie?
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList?.Search.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let takeMovies = moviesList?.Search[indexPath.row]
        cell.textLabel?.text = takeMovies?.title
        return cell
    }
    
    func update(with movies: SearchMovie) {
        DispatchQueue.main.async {
            self.moviesList = movies
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.moviesList = [] as? SearchMovie
            self.tableView.isHidden = true
            
        }
    }
}
