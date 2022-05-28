//
//  LoginPresenter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class LoginPresenter : ViewToPresenterLoginProtocol {
    
    var loginInteractor: PresenterToInteractorLoginProtocol?
    
    func loginAll(email: String, password: String) {
        loginInteractor?.login(email: email, password: password)
    }
    
}
