//
//  SplashPresenter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 4.06.2022.
//

import Foundation

class SplashPresenter: ViewToPresenterSplashProtocol {
    
    var splashInteractor: PresenterToInteractorSplashProtocol?
    var splashView: PresenterToViewSplashProtocol?
    var splashRouter: PresenterToRouterSplashProtocol?
   
    func viewDidAppear() {
        splashInteractor?.checkInternetConnection()
    }
}

extension SplashPresenter: InteractorToPresenterSplashProtocol {
    
    func internetConnection(status: Bool) {
        
        if status {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.splashRouter?.navigate()
            }
        } else {
            splashView?.noInternetConnection()
        }
    }

}
