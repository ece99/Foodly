//
//  FoodDetailRouter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class FoodDetailRouter: PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailVC) {
        let presenter = FoodDetailPresenter()
        ref.foodPresenterObject = presenter
        ref.basketPresenterObject = BasketPresenter()
        ref.foodPresenterObject?.foodInteractor = FoodDetailInteractor()
        
        let basketPresenter = BasketPresenter()
        ref.basketPresenterObject = basketPresenter
        ref.basketPresenterObject?.basketInteractor = BasketInteractor()
        ref.basketPresenterObject?.basketView = ref
        ref.basketPresenterObject?.basketInteractor?.basketPresenter = basketPresenter
        
    }
    
    
}

