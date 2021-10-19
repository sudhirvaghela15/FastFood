//
//  FoodCategoriesCell_Extention.swift
//  Fast_Food
//
//  Created by sudhir on 03/08/21.
//FCC = FoodCategoriesCell

import Foundation
import UIKit

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
        
        //create dequeueReusableCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCell",
                                                      for: indexPath)as! FoodItemCell
        
        cell.itemImage.image    = UIImage(named: catagories[collectionView.tag]
                                                    .subItmeImage[indexPath.row])
        cell.itemName.text      = catagories[collectionView.tag].subItemName[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.clipsToBounds      = true
        cell.layer.borderWidth  = 1.0
        cell.layer.borderColor  = UIColor.black.cgColor
        
        return cell
    }
    
    //clickProtocol delegate
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
