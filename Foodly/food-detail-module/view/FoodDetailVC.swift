//
//  FoodDetailVC.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import UIKit

class FoodDetailVC: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func increaseCount(_ sender: Any) {
    }
    
    
    @IBAction func decreaseCount(_ sender: Any) {
    }
    
    
    @IBAction func addToBasket(_ sender: Any) {
    }
}
