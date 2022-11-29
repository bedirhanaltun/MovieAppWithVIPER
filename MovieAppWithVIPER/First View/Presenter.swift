//
//  Presenter.swift
//  MovieAppWithVIPER
//
//  Created by Bedirhan Altun on 21.09.2022.
//

import Foundation

enum NetworkError: Error{
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter{
    
    var view: AnyView? {get set}
    var interactor: AnyInteractor? {get set}
    var router: AnyRouter? {get set}
    
    func interactorDidDownloadMovie(result: Result<SearchMovie,Error>)
}

class MoviePresenter: AnyPresenter{
    var view: AnyView?
    
    var interactor: AnyInteractor?{
        didSet{
            interactor?.downloadData()
        }
    }
    
    var router: AnyRouter?
    
    func interactorDidDownloadMovie(result: Result<SearchMovie, Error>) {
        
        switch result{
        case .success(let movies):
            view?.update(with: movies)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
        
    }
 
}
