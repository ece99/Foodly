//
//  ProfileRouter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class ProfileRouter : PresenterToRouterProfileProtocol {
    static func createModule(ref: ProfileVC) {
        let presenter = ProfilePresenter()
        ref.profilePresenter = presenter
        ref.profilePresenter?.profileInteractor = ProfileInteractor()
        ref.profilePresenter?.profileView = ref
        ref.profilePresenter?.profileInteractor?.profilePresenter = presenter
    }
    
}

