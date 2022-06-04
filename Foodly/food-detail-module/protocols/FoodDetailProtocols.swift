//
//  FoodDetailProtocols.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

protocol ViewToPresenterFoodDetailProtocol {
    var foodInteractor: PresenterToInteractorFoodDetailProtocol? { get set }
    
    func postToBasket(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String)

}

protocol PresenterToInteractorFoodDetailProtocol {
    func postFoodToBasket(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String)
}

protocol InteractorToPresenterFoodDetailProtocol {
    func sendDataToPresenter(foodListInBasket: Array<FoodsInBasket>)
}

protocol PresenterToViewFoodDetailProtocol {
    func sendDataToView(foodListInBasket: Array<FoodsInBasket>)
}

protocol PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailVC)
}

