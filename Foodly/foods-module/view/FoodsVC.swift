//
//  FoodsVC.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import UIKit
import Kingfisher

class FoodsVC: UIViewController {

    @IBOutlet weak var foodSearchBar: UISearchBar!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var foodList = [Foods]()
    var filterFood = [Foods]()
    var foodsPresenter: ViewToPresenterFoodsProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        foodSearchBar.delegate = self
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        let foodTasarim = UICollectionViewFlowLayout()
        foodTasarim.sectionInset = UIEdgeInsets(top: 8, left: 3, bottom: 8, right: 3)
        foodTasarim.minimumLineSpacing = 20
        foodTasarim.minimumInteritemSpacing = 10
        let width = foodCollectionView.frame.size.width
        let cellWidht = (width - 30) / 2
        foodTasarim.itemSize = CGSize(width: cellWidht, height: cellWidht*1.1)
        foodCollectionView.collectionViewLayout = foodTasarim
        
        FoodsRouter.createModule(ref: self)
        foodsPresenter?.getAllFoods()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "toFoodDetail"{
            if let food = sender as? Foods {
                let detailViewController = segue.destination as! FoodDetailVC
                detailViewController.foodDetail = food
            }
        }
    }
}

extension FoodsVC: PresenterToViewFoodsProtocol {
    func sendDataToView(foodList: Array<Foods>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.foodCollectionView.reloadData()
        }
    }
}

extension FoodsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodsCollectionViewCell
        
        cell.layer.cornerRadius = 10
        
        let foodImage = foodList[indexPath.row].yemek_resim_adi
        let foodPrice = foodList[indexPath.row].yemek_fiyat
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(foodImage)")
        cell.foodImageView.kf.setImage(with: url)
        cell.foodImageView.frame.size.height = cell.foodImageView.frame.width
        cell.foodName.text = foodList[indexPath.row].yemek_adi
        cell.foodPrice.text = "\(foodPrice) ₺"
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foodList[indexPath.row]
        performSegue(withIdentifier:"toFoodDetail", sender: food)
    }
    
}

extension FoodsVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterFood = self.foodList.filter { f in
            if f.yemek_adi.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.foodCollectionView.reloadData()
    }
}
