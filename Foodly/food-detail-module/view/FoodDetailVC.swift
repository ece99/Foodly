//
//  FoodDetailVC.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import UIKit
import Kingfisher

class FoodDetailVC: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    var foodDetail: Foods?
    var foodsInBasket =  [FoodsInBasket]()
    var foodPresenterObject: ViewToPresenterFoodDetailProtocol?
    var basketPresenterObject: ViewToPresenterBasketProtocol?
    
    var count : Int = 1

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodName.text = foodDetail?.yemek_adi
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(foodDetail!.yemek_resim_adi)"){
            DispatchQueue.main.async {
                self.foodImageView.kf.setImage(with: url)            }
        }
        
        foodPrice.text = "\(foodDetail!.yemek_fiyat) ₺"
        
        FoodDetailRouter.createModule(ref: self)
        BasketRouter.createModule(ref: (self.navigationController?.tabBarController?.viewControllers![1]) as! BasketVC)
        basketPresenterObject?.getAllFoodsInBasket(userName: "Ece")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        for i in foodsInBasket {
            if foodDetail?.yemek_adi == i.yemek_adi {
                count = Int(i.yemek_siparis_adet!)!
            }
        }
    }
    
    @IBAction func increaseCount(_ sender: Any) {
        add()
    }
    
    
    @IBAction func decreaseCount(_ sender: Any) {
        subtract()
    }
    
    
    @IBAction func addToBasket(_ sender: Any) {
        
        var check = false
        for i in foodsInBasket {
            if foodDetail?.yemek_adi == i.yemek_adi {
                basketPresenterObject?.deleteFromBasket(sepet_yemek_id: Int(i.sepet_yemek_id!)!, userName: "Ece")
                foodPresenterObject?.postToBasket(foodName: foodDetail!.yemek_adi, foodImageName: foodDetail!.yemek_resim_adi, foodPrice: Int(foodDetail!.yemek_fiyat)!, foodOrderQuantity:Int(i.yemek_siparis_adet!)!, userName: "Ece")
                
                check = true
            }
        }
        
        if check == false {
            foodPresenterObject?.postToBasket(foodName: foodDetail!.yemek_adi, foodImageName: foodDetail!.yemek_resim_adi, foodPrice: Int(foodDetail!.yemek_fiyat)!, foodOrderQuantity:count, userName: "Ece")
        }
        
    }
    
    func add(){
        if count >= 1 && count < 20{
            count += 1
        }
        countLabel.text = "\(count)"
        
        if let f = foodDetail{
            let dataPrice = Int(f.yemek_fiyat)
            foodPrice.text = "₺\(dataPrice! * count).00"
        }
    }
    
    func subtract(){
        if count > 1 && count <= 20{
            count -= 1
        }
        countLabel.text = "\(count)"
        
        if let f = foodDetail{
            let dataPrice = Int(f.yemek_fiyat)
            foodPrice.text = "₺\(dataPrice! * count).00"
        }
    }
}

extension FoodDetailVC: PresenterToViewFoodDetailProtocol, PresenterToViewBasketProtocol {
    func sendDataToView(foodListInBasket: Array<FoodsInBasket>) {
            self.foodsInBasket = foodListInBasket
    }
}
