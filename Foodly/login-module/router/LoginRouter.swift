//
//  LoginRouter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class LoginRouter : PresenterToRouterLoginProtocol {
    static func createModule(ref: LoginVC) {
       
        let presenter = LoginPresenter()
    
        ref.loginPresenter = presenter
        ref.loginPresenter?.loginInteractor = LoginInteractor()
        ref.loginPresenter?.loginView = ref
        ref.loginPresenter?.loginInteractor?.loginPresenter = presenter
    }
    
}
