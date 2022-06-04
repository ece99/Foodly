//
//  CreateAlert.swift
//  Foodly
//
//  Created by Ece Ayvaz on 4.06.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
  func exitAppAlert(message: String, title: String ) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default){_ in
        exit(0)
    }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
    
  func returnToPreviousPageAlert (message: String, title: String ) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default){_ in
        _ = self.navigationController?.popViewController(animated: true)
    }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
    
    func giveWarningAlert (message: String, title: String ) {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default){_ in
      }
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    
}

