//
//  ItemMenuCell.swift
//  Fast_Food
//
//  Created by sudhir on 01/06/21.
//

import UIKit

protocol FoodCategoriesCellDelegate:AnyObject {
   
    func onClickFoodCategoriesCell(
        collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    )
}


class FoodCategoriesCell: UITableViewCell {
    
    @IBOutlet weak var foodItemCollectionView: UICollectionView!
    
    weak var delegate:FoodCategoriesCellDelegate?  //custom delegate
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionDelegate()
        collectionCellRegister()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    //set collection delegate
    func collectionDelegate(){
        foodItemCollectionView.delegate   = self
        foodItemCollectionView.dataSource = self
    }
    
    //set custom nib for collection cell
    func collectionCellRegister(){
        let nib = UINib(nibName: "FoodItemCell", bundle: nil)
        foodItemCollectionView.register(nib, forCellWithReuseIdentifier: "FoodItemCell")
    }
}

