//
//  DetailsRouter.swift
//  MovieAppWithVIPER
//
//  Created by Bedirhan Altun on 21.09.2022.
//

import Foundation
import UIKit

typealias ViewPoint = AnyDetailsView & UIViewController

protocol AnyDetailsRouter{
    var viewPoint : ViewPoint? {get}
    
    static func keepGoing() -> AnyDetailsRouter
}

class DetailsRouter: AnyDetailsRouter{
    var viewPoint: ViewPoint?
    
    static func keepGoing() -> AnyDetailsRouter {
        
        let router = DetailsRouter()
        var DetailsRouterView: AnyDetailsView = DetailsViewController()
        
        
        router.viewPoint = DetailsRouterView as? ViewPoint
        
        return router
    }
    
    
}


