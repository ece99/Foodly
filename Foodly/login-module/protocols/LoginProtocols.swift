//
//  LoginProtocols.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

protocol ViewToPresenterLoginProtocol {
    var loginInteractor : PresenterToInteractorLoginProtocol? {get set}
    var loginView: PresenterToViewLoginProtocol? { get set }

    func loginAll(email : String, password : String)
}

protocol PresenterToInteractorLoginProtocol {
    var loginPresenter: InteractorToPresenterLoginProtocol? { get set }
    
    func login(email : String, password : String )
}

protocol PresenterToRouterLoginProtocol {
    static func createModule(ref:LoginVC)
}

protocol InteractorToPresenterLoginProtocol {
    func navigateToFoodsPage()
    func showErrorAlert()
}

protocol PresenterToViewLoginProtocol {
    func navigateToFoodsPage()
    func showErrorAlert()
}
