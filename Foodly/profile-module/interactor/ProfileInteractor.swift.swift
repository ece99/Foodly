//
//  ProfileInteractor.swift.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation
import Firebase

class ProfileInteractor : PresenterToInteractorProfileProtocol {
    var profilePresenter: InteractorToPresenterProfileProtocol?
    
    func showInfo() {
        let auth = Auth.auth()
        let email = (auth.currentUser?.email)!
        profilePresenter?.sendDataToPresenter(email: email)
    }
    
}

