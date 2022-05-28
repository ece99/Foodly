//
//  BasketProtocols.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation


protocol ViewToPresenterBasketProtocol {
    var basketInteractor: PresenterToInteractorBasketProtocol? { get set }
    var basketView: PresenterToViewBasketProtocol? { get set }
    
    func getAllFoodsInBasket(userName: String)
    func deleteFromBasket(sepet_yemek_id: Int, userName: String)
}

protocol PresenterToInteractorBasketProtocol {
    var basketPresenter: InteractorToPresenterBasketProtocol? { get set }
    
    func getFoodsInBasket(userName: String)
    func deleteFoodFromBasket(sepet_yemek_id: Int, userName: String)
}

protocol InteractorToPresenterBasketProtocol {
    func sendDataToPresenter(foodListInBasket: Array<FoodsInBasket>)
}

protocol PresenterToViewBasketProtocol {
    func sendDataToView(foodListInBasket: Array<FoodsInBasket>)
}

protocol PresenterToRouterProtocol {
    static func createModule(ref: BasketVC)
}
