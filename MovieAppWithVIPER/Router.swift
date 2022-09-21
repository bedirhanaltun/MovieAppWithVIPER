//
//  Router.swift
//  MovieAppWithVIPER
//
//  Created by Bedirhan Altun on 21.09.2022.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{
    
    var entry: EntryPoint? {get}
    
    static func startApp() -> AnyRouter
}

class MovieRouter: AnyRouter{
    var entry: EntryPoint?
    
 
    static func startApp() -> AnyRouter {
        let router = MovieRouter()
        var RouterView: AnyView = MovieViewController()
        var RouterPresenter: AnyPresenter = MoviePresenter()
        var RouterInteractor: AnyInteractor = MovieInteractor()
        
        RouterView.presenter = RouterPresenter
        
        RouterPresenter.view = RouterView
        RouterPresenter.interactor = RouterInteractor
        RouterPresenter.router = router
        
        RouterInteractor.presenter = RouterPresenter
        
        router.entry = RouterView as? EntryPoint
        return router
    }
}

