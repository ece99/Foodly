//
//  FoodsRouter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class FoodsRouter: PresenterToRouterFoodsProtocol {
    static func createModule(ref: FoodsVC) {
        let presenter = FoodsPresenter()
        ref.foodsPresenter = presenter
        ref.foodsPresenter?.foodsInteractor = FoodsInteractor()
        ref.foodsPresenter?.foodsView = ref
        ref.foodsPresenter?.foodsInteractor?.foodsPresenter = presenter
    }
    
}
