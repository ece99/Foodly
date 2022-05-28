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
        
        auth.addStateDidChangeListener() { (auth,user) in
            if user != nil {
                print("start login success: " + (user?.email)! )
                self.performSegue(withIdentifier: "toFoods", sender: nil)
                
            }else {
                let alert = UIAlertController(title: "Error", message: "Invalid email or password", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Okay", style: .default){ action in
                    self.navigationController?.popToRootViewController(animated: true)
                }
                alert.addAction(OKAction)
                self.present(alert, animated: true)
                print("No user is signed in.")
            }
            
        }
    }
    
    @IBAction func pressSignInButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignIn", sender: nil)
    }
}
