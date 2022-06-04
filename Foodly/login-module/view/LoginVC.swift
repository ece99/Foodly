//
//  LoginVC.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginPresenter: ViewToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginRouter.createModule(ref: self)
    }
        
    @IBAction func pressLoginButton(_ sender: Any) {
        let auth = Auth.auth()
        if let te = emailTextField.text, let tp = passwordTextField.text {
            loginPresenter?.loginAll(email: te, password: tp)
        }
    }
    
    @IBAction func pressSignInButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignIn", sender: nil)
    }
}



extension LoginVC: PresenterToViewLoginProtocol {
    
    func navigateToFoodsPage() {
        self.performSegue(withIdentifier: "toFoods", sender: nil)
    }
    
    func showErrorAlert() {
        giveWarningAlert(message:"Trying to login with wrong username or password. Please try again!", title: "Warning")
    }

}
