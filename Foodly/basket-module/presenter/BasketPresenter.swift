//
//  BasketPresenter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class BasketPresenter: ViewToPresenterBasketProtocol {
    
    var basketInteractor: PresenterToInteractorBasketProtocol?
    
    var basketView: PresenterToViewBasketProtocol?
    
    func getAllFoodsInBasket(userName: String) {
        basketInteractor?.getFoodsInBasket(userName: userName)
    }
    
    func deleteFromBasket(sepet_yemek_id: Int, userName: String) {
        basketInteractor?.deleteFoodFromBasket(sepet_yemek_id: sepet_yemek_id, userName: userName)
    }
    
    
}

extension BasketPresenter: InteractorToPresenterBasketProtocol {
    
    func sendDataToPresenter(foodListInBasket: Array<FoodsInBasket>) {
        basketView?.sendDataToView(foodListInBasket: foodListInBasket)
    }

}
