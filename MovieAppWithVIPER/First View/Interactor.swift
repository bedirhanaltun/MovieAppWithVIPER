//
//  Interactor.swift
//  MovieAppWithVIPER
//
//  Created by Bedirhan Altun on 21.09.2022.
//

import Foundation
import UIKit

protocol AnyInteractor{
    
    var presenter: AnyPresenter? {get set}
    func downloadData()
}

class MovieInteractor: AnyInteractor{
    var presenter: AnyPresenter?
    
    func downloadData() {
        guard let url = URL(string: "https://www.omdbapi.com/?s=lord&page=2&apikey=9893101c") else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            guard let data = data, error == nil else{
                self.presenter?.interactorDidDownloadMovie(result: .failure(NetworkError.NetworkFailed))
                return
            }
            
            guard let response = response else{
                return
            }
            
            do{
                let movies = try JSONDecoder().decode(SearchMovie.self, from: data)
                self.presenter?.interactorDidDownloadMovie(result: .success(movies))
            }
            catch{
                self.presenter?.interactorDidDownloadMovie(result: .failure(NetworkError.ParsingFailed))
            }
            
            
        }.resume()
    
    
    }

}

extension MovieInteractor{
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        
    }
}
