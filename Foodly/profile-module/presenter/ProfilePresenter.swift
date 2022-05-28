//
//  ProfilePresenter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class ProfilePresenter : ViewToPresenterProfileProtocol {
    
    var profileView: PresenterToViewProfileProtocol?
    var profileInteractor: PresenterToInteractorProfileProtocol?
    
    func showInfoAll() {
        profileInteractor?.showInfo()
    }
}

extension ProfilePresenter : InteractorToPresenterProfileProtocol{
    
    func sendDataToPresenter(email: String) {
        profileView?.sendDataToView(email: email)
    }
}
