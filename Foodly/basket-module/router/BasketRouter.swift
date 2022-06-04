//
//  BasketRouter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class BasketRouter: PresenterToRouterProtocol {
    
    static func createModule(ref: BasketVC) {
        let presenter = BasketPresenter()
    
        ref.basketPresenterObject = presenter
        ref.basketPresenterObject?.basketInteractor = BasketInteractor()
        ref.basketPresenterObject?.basketView = ref
        ref.basketPresenterObject?.basketInteractor?.basketPresenter = presenter
        
        
    }
    
    
}
