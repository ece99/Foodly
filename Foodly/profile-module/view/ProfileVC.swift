//
//  ProfileVC.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var emailTextField: UILabel!
    
    var profilePresenter: ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profilePresenter?.showInfoAll()
    }
    
    @IBAction func pressLogoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }catch { print("Already logged out") }
    
        performSegue(withIdentifier: "toLoginPage", sender: nil)
    }
}

extension ProfileVC : PresenterToViewProfileProtocol{
    
    func sendDataToView(email: String) {
        self.emailTextField.text = email
    }
    
}
