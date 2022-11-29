//
//  DetailsView.swift
//  MovieAppWithVIPER
//
//  Created by Bedirhan Altun on 21.09.2022.
//

//let storyBoard = UIStoryboard(name: "MovieDetail", bundle: nil)
//let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

import Foundation
import UIKit

protocol AnyDetailsView{
    var detailsPresenter: AnyDetailsPresenter? {get set}
}

var window: UIWindow?

class DetailsViewController: UIViewController,AnyDetailsView{
    var detailsPresenter: AnyDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private let titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.text = "Test"
        return titleLabel
    }()
    
    private let typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "Test2"
        return typeLabel
    }()
    
}
