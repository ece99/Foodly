//
//  SplashVC.swift
//  Foodly
//
//  Created by Ece Ayvaz on 4.06.2022.
//

import UIKit

class SplashVC: UIViewController {

    var splashPresenter: ViewToPresenterSplashProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SplashRouter.createModule(ref: self)
        
        splashPresenter?.viewDidAppear()
    }
    
    func showAlert(title:String, message:String) {
        DispatchQueue.main.async {
            self.exitAppAlert(message: message, title: title)
        }
    }
}

extension SplashVC: PresenterToViewSplashProtocol {
    
    func noInternetConnection() {
        showAlert(title: "Error", message: "No Internet Connection, Please check your connection")
    }
}
