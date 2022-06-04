//
//  RegisterInteractor.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation
import Firebase

class RegisterInteractor : PresenterToInteractorRegisterProtocol {
    
    var registerPresenter: InteractorToPresenterRegisterProtocol?
    
    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
                self.registerPresenter?.showErrorAlert()
            } else {
                self.registerPresenter?.navigateToLogin()
            }
        }
    }
}
