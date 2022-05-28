//
//  RegisterRouter.swift.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class RegisterRouter : PresenterToRouterRegisterProtocol {
    static func createModule(ref: RegisterVC) {
        ref.registerRresenter = RegisterPresenter()
        ref.registerRresenter?.registerInteractor = RegisterInteractor()
    }
}
