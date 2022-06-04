//
//  RegisterVC.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var registerPresenter : ViewToPresenterRegisterProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterRouter.createModule(ref: self)
    }

    @IBAction func pressRegisterButton(_ sender: Any) {
        
        if let te = emailTextField.text, let tp = passwordTextField.text {
            registerPresenter?.registerAll(email: te, password: tp)
        }
    }
    
    @IBAction func pressTurnLoginPageButton(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
}

extension RegisterVC: PresenterToViewRegisterProtocol {
    
    func navigateToLogin() {
        let alert = UIAlertController(title: "WELCOME", message: "Thank you for signing up", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default) {
            action in
            self.performSegue(withIdentifier: "toLogin", sender: nil)
        }
        alert.addAction(okayAction)
        self.present(alert, animated: true)
        
    }
    
    func showErrorAlert() {
        giveWarningAlert(message:"Trying to register incorrectly or incompletely!", title: "Warning")
    }

}
