//
//  SplashInteractor.swift
//  Foodly
//
//  Created by Ece Ayvaz on 4.06.2022.
//

import Foundation

class SplashInteractor: PresenterToInteractorSplashProtocol {
    var splashPresenter: InteractorToPresenterSplashProtocol?
    
    func checkInternetConnection() {
        let internetStatus = NetworkManager.shared.isConnectedToInternet()
        self.splashPresenter?.internetConnection(status: internetStatus)
    }
}
