//
//  LoginProtocols.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

protocol ViewToPresenterLoginProtocol {
    var loginInteractor : PresenterToInteractorLoginProtocol? {get set}
    func loginAll(email : String, password : String)
}

protocol PresenterToInteractorLoginProtocol {
    func login(email : String, password : String )
}

protocol PresenterToRouter {
    static func createModule(ref:LoginVC)
}
