//
//  LoginInteractor.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation
import Firebase

class LoginInteractor : PresenterToInteractorLoginProtocol {
    
    var loginPresenter: InteractorToPresenterLoginProtocol?
    
    func login(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
                self.loginPresenter?.showErrorAlert()
            } else {
                self.loginPresenter?.navigateToFoodsPage()
            }
        }
    }
}
