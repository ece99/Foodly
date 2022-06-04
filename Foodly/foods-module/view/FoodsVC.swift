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
    var isFiltering: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        foodSearchBar.delegate = self
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        
        let collectionWidth = foodCollectionView.frame.size.width
        let cellWidth = (collectionWidth -  60) / 2
        layout.itemSize = CGSize(width: cellWidth , height: cellWidth + 20)
        
        foodCollectionView.collectionViewLayout = layout
        
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
    
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            if isFiltering{
                return filterFood.count
            }else{
                return foodList.count

            }
        }

    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodsCollectionViewCell

          cell.layer.cornerRadius = 10
          if isFiltering {
              let foodImage = filterFood[indexPath.row].yemek_resim_adi
              let foodPrice = filterFood[indexPath.row].yemek_fiyat

              let url = URL(string: Constants.baseGetFoodImageURL + foodImage)
              cell.foodImageView.kf.setImage(with: url)
              cell.foodImageView.frame.size.height = cell.foodImageView.frame.width
              cell.foodName.text = filterFood[indexPath.row].yemek_adi
              cell.foodPrice.text = "\(foodPrice) ₺"
          }
          else{
              let foodImage = foodList[indexPath.row].yemek_resim_adi
              let foodPrice = foodList[indexPath.row].yemek_fiyat

              let url = URL(string:Constants.baseGetFoodImageURL + foodImage)
              cell.foodImageView.kf.setImage(with: url)
              cell.foodImageView.frame.size.height = cell.foodImageView.frame.width
              cell.foodName.text = foodList[indexPath.row].yemek_adi
              cell.foodPrice.text = "\(foodPrice) ₺"
          }


          return cell
      }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foodList[indexPath.row]
        performSegue(withIdentifier:"toFoodDetail", sender: food)
    }
    
}

extension FoodsVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            self.isFiltering = false
                    self.foodCollectionView.reloadData()
                }
                else if searchText.count >= 1 {
                    self.filterFood = foodList.filter({ (food : Foods!) -> Bool in
                        return (food.yemek_adi.lowercased().contains(searchText.lowercased()))
                    })

                    self.isFiltering = true
                    self.foodCollectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar) {
            self.foodSearchBar.endEditing(true)
        }

    func searchBarCancelButtonClicked( _ searchBar: UISearchBar) {
            isFiltering = false
            self.foodSearchBar.text = ""
            self.foodCollectionView.reloadData()
            self.foodSearchBar.endEditing(true)

        }
    
    func searchBarTextDidEndEditing( _ searchBar: UISearchBar) {
            self.foodSearchBar.endEditing(true)
        }
}
