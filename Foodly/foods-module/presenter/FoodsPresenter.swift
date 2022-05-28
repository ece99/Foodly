//
//  FoodsPresenter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class FoodsPresenter: ViewToPresenterFoodsProtocol {
    var foodsInteractor: PresenterToInteractorFoodsProtocol?
    var foodsView: PresenterToViewFoodsProtocol?
    
    func getAllFoods() {
        foodsInteractor?.getFoods()
    }
}

extension FoodsPresenter: InteractorToPresenterFoodsProtocol {
    
    func sendDataToPresenter(foodList: Array<Foods>) {
        foodsView?.sendDataToView(foodList: foodList)
    }
}
