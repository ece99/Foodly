//
//  RegisterProtocols.swift.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

protocol ViewToPresenterRegisterProtocol {
    var registerInteractor : PresenterToInteractorRegisterProtocol? {get set}
    var registerView: PresenterToViewRegisterProtocol? { get set }

    
    func registerAll(email : String, password : String)
}

protocol PresenterToInteractorRegisterProtocol {
    var registerPresenter: InteractorToPresenterRegisterProtocol? { get set }

    func register(email : String, password : String)
}

protocol PresenterToRouterRegisterProtocol {
    static func createModule(ref: RegisterVC)
}

protocol InteractorToPresenterRegisterProtocol {
    func navigateToLogin()
    func showErrorAlert()
}

protocol PresenterToViewRegisterProtocol {
    func navigateToLogin()
    func showErrorAlert()
}
