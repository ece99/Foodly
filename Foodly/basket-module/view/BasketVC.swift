//
//  BasketVC.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import UIKit

class BasketVC: UIViewController {

    @IBOutlet weak var basketTableView: UITableView!
    
    @IBOutlet weak var foodsTotalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressPayButton(_ sender: Any) {
    }
}
