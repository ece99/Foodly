//
//  RegisterRouter.swift.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class RegisterRouter : PresenterToRouterRegisterProtocol {
    static func createModule(ref: RegisterVC) {
        let presenter = RegisterPresenter()
    
        ref.registerPresenter = presenter
        ref.registerPresenter?.registerInteractor = RegisterInteractor()
        ref.registerPresenter?.registerView = ref
        ref.registerPresenter?.registerInteractor?.registerPresenter = presenter
    }
}
