//
//  FoodsProtocols.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

protocol ViewToPresenterFoodsProtocol {
    var foodsInteractor: PresenterToInteractorFoodsProtocol? { get set }
    var foodsView: PresenterToViewFoodsProtocol? { get set }
    
    func getAllFoods()
}

protocol PresenterToInteractorFoodsProtocol {
    var foodsPresenter: InteractorToPresenterFoodsProtocol? { get set }
    
    func getFoods()
}

protocol InteractorToPresenterFoodsProtocol {
    func sendDataToPresenter(foodList: Array<Foods>)
}

protocol PresenterToViewFoodsProtocol {
    func sendDataToView(foodList: Array<Foods>)
}

protocol PresenterToRouterFoodsProtocol {
    static func createModule(ref: FoodsVC)
}
