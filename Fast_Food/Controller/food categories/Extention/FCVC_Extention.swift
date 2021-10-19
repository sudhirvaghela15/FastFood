//
//  FCVC_Extention.swift
//  Fast_Food
//
//  Created by sudhir on 03/08/21.
//FCVC = FoodCategoriesViewController


import Foundation
import UIKit


// MARK : Food Categories cell delegate (CollectionView delegate)

//it's handle CollectionView didSelectItemAt IndexPah and navigate to next view controller
extension FoodCategoriesViewController:
          FoodCategoriesCellDelegate{
    
    //click delegate
    func onClickFoodCategoriesCell(
        collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath ) {
        
        print("item index :\(indexPath.row)")//debug
        print("item name :\(catagories[collectionView.tag].subItemName[indexPath.row]),tag: \(collectionView.tag)")//debug
        
        let vc = storyboard?
            .instantiateViewController(
                withIdentifier: "OrderItemsViewController")
            as! OrderItemsViewController
        
        vc.title =
            catagories[collectionView.tag]
            .subItemName[indexPath.row]
        
        vc.image =
            UIImage(named: catagories[collectionView.tag]
            .subItmeImage[indexPath.row])
        
        self.navigationController?
            .pushViewController(vc, animated: true)
    }
}

