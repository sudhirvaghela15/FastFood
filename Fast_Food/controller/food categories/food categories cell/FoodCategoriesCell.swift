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
    
    weak var delegate:FoodCategoriesCellDelegate?  //delegate
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionDelegate()
        collectionCellRegister()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func collectionDelegate(){
        foodItemCollectionView.delegate   = self
        foodItemCollectionView.dataSource = self
    }
    
    func collectionCellRegister(){
        let nib = UINib(nibName: "FoodItemCell", bundle: nil)
        foodItemCollectionView.register(nib, forCellWithReuseIdentifier: "FoodItemCell")
    }
}

//extension for Inner CollectionView
extension FoodCategoriesCell:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catagories[collectionView.tag].subItemName.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "FoodItemCell",
            for: indexPath)as! FoodItemCell
    
        cell.itemImage.image    =
            UIImage(named: catagories[collectionView.tag]
            .subItmeImage[indexPath.row])
        cell.itemName.text      =
            catagories[collectionView.tag]
            .subItemName[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.clipsToBounds      = true
        cell.layer.borderWidth  = 1.0
        cell.layer.borderColor  = UIColor.black.cgColor
        
    return cell
    }
    
    //clickProtocol deelegate
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
    //set delegate from FoodItemCell to tableview
        delegate?.onClickFoodCategoriesCell(
            collectionView  : collectionView,
            didSelectItemAt : indexPath
        )
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: (foodItemCollectionView.frame.size.width - 10) / 2, height: (foodItemCollectionView.frame.size.height - 10) / 2)
    }
}
