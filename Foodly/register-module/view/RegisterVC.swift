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
    
    var registerRresenter : ViewToPresenterRegisterProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterRouter.createModule(ref: self)
    }

    @IBAction func pressRegisterButton(_ sender: Any) {
        
        if let te = emailTextField.text, let tp = passwordTextField.text {
            registerRresenter?.registerAll(email: te, password: tp)
        }
        
        let alert = UIAlertController(title: "WELCOME", message: "Thank you for signing up", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default) {
            action in
            self.performSegue(withIdentifier: "toLogin", sender: nil)
        }
        alert.addAction(okayAction)
        self.present(alert, animated: true)
        
    }
    
    @IBAction func pressTurnLoginPageButton(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
}
