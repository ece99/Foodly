//
//  BasketTableViewCell.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodCount: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
