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
    
    var basketPresenterObject: ViewToPresenterBasketProtocol?
    var foodList =  [FoodsInBasket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basketTableView.delegate = self
        basketTableView.dataSource = self
        basketTableView.rowHeight = 120
    }
    
    override func viewWillAppear(_ animated: Bool) {
        basketPresenterObject?.getAllFoodsInBasket(userName: "Ece")
        calculateTotalPrice()
    }
    
    func calculateTotalPrice () {
        var total = 0
        for i in foodList {
            total += Int(i.yemek_fiyat!)! * Int(i.yemek_siparis_adet!)!
        }
        foodsTotalPrice.text = String(total)
    }
    
    @IBAction func pressPayButton(_ sender: Any) {
    }
}

extension BasketVC: PresenterToViewBasketProtocol {
    func sendDataToView(foodListInBasket: Array<FoodsInBasket>) {
        self.foodList = foodListInBasket
        DispatchQueue.main.async {
            self.calculateTotalPrice()
            self.basketTableView.reloadData()
        }
    }

}

extension BasketVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! BasketTableViewCell
        
        
        cell.foodName.text = foodList[indexPath.row].yemek_adi
        cell.foodPrice.text = "Per:\(foodList[indexPath.row].yemek_fiyat!) "
        cell.foodCount.text = foodList[indexPath.row].yemek_siparis_adet
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\( foodList[indexPath.row].yemek_resim_adi!)")
        cell.foodImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action,view,void) in
            self.basketPresenterObject?.deleteFromBasket(sepet_yemek_id: Int(self.foodList[indexPath.row].sepet_yemek_id!)!, userName: "Ece")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}

