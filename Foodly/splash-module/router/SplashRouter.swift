//
//  SplashRouter.swift
//  Foodly
//
//  Created by Ece Ayvaz on 4.06.2022.
//

import Foundation
import UIKit

class SplashRouter: PresenterToRouterSplashProtocol {
    
    weak var viewController: SplashVC?

    static func createModule(ref: SplashVC) {
        let presenter = SplashPresenter()
        let router = SplashRouter()
        ref.splashPresenter = presenter
        ref.splashPresenter?.splashInteractor = SplashInteractor()
        ref.splashPresenter?.splashView = ref
        ref.splashPresenter?.splashRouter = router
        ref.splashPresenter?.splashInteractor?.splashPresenter = presenter
        
        router.viewController = ref
    }
    
    func navigate() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVCFoodly") as UIViewController
        guard let window = viewController?.view.window else { return }
        let navigationController = UINavigationController(rootViewController: loginVC)
        window.rootViewController = navigationController
    }
    
}
