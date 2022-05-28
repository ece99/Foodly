//
//  LoginInteractor.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation
import Firebase

class LoginInteractor : PresenterToInteractorLoginProtocol {
    
    func login(email: String, password: String) {
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) { authResult, error in
            
            if error != nil {
                print(error ?? "Error was occured when trying to login!")
            }
            
        }
    }
    
    
}
