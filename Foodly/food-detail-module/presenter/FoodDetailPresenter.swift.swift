//
//  FoodDetailPresenter.swift.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class FoodDetailPresenter: ViewToPresenterFoodDetailProtocol, ViewToPresenterBasketProtocol {
    
    var basketInteractor: PresenterToInteractorBasketProtocol?
    var basketView: PresenterToViewBasketProtocol?
    
    func getAllFoodsInBasket(userName: String) {
        basketInteractor?.getFoodsInBasket(userName: userName)
    }
    
    func deleteFromBasket(sepet_yemek_id: Int, userName: String) {
        basketInteractor?.deleteFoodFromBasket(sepet_yemek_id: sepet_yemek_id, userName: userName)
    }
    
    var foodInteractor: PresenterToInteractorFoodDetailProtocol?
    
    func postToBasket(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String){
        foodInteractor?.postFoodToBasket(foodName: foodName, foodImageName: foodImageName, foodPrice: foodPrice, foodOrderQuantity: foodOrderQuantity, userName: userName)
    }
    
}

extension FoodDetailPresenter: InteractorToPresenterBasketProtocol {
    func sendDataToPresenter(foodListInBasket: Array<FoodsInBasket>) {
        basketView?.sendDataToView(foodListInBasket: foodListInBasket)
    }
   
}
