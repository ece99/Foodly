//
//  SplashProtocols.swift
//  Foodly
//
//  Created by Ece Ayvaz on 4.06.2022.
//

import Foundation

protocol ViewToPresenterSplashProtocol {
    var splashInteractor: PresenterToInteractorSplashProtocol? { get set }
    var splashView: PresenterToViewSplashProtocol? { get set }
    var splashRouter: PresenterToRouterSplashProtocol? { get set }
    
    func viewDidAppear()
}

protocol PresenterToInteractorSplashProtocol {
    var splashPresenter: InteractorToPresenterSplashProtocol? { get set }
    
    func checkInternetConnection()
}

protocol InteractorToPresenterSplashProtocol {
    func internetConnection(status: Bool)
}

protocol PresenterToViewSplashProtocol {
    func noInternetConnection()
}


protocol PresenterToRouterSplashProtocol {
    static func createModule(ref: SplashVC)
    func navigate ()
}

