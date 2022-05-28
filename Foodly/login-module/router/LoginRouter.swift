//
//  LoginRouter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class LoginRouter : PresenterToRouter {
    static func createModule(ref: LoginVC) {
        ref.loginPresenter = LoginPresenter()
        ref.loginPresenter?.loginInteractor = LoginInteractor()
    }
    
}
