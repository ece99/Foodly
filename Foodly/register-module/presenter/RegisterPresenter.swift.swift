//
//  RegisterPresenter.swift.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class RegisterPresenter : ViewToPresenterRegisterProtocol {
    
    var registerInteractor: PresenterToInteractorRegisterProtocol?
    
    func registerAll(email: String, password: String) {
        registerInteractor?.register(email: email, password: password)
    }
    
}
