//
//  DVC_CollectionView_Extention.swift
//  Fast_Food
//
//  Created by sudhir on 03/08/21.
//

import Foundation
import UIKit


//MARK: Inner card collectionView( benner )
extension DashboardViewController:
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CollectionViewCell",
            for: indexPath)as! CollectionViewCell
        
        cell.ibImageHolder.image = UIImage(named: data[indexPath.row])
        cell.layer.cornerRadius  = 20
        cell.layer.borderWidth   = 1.0
        cell.layer.borderColor   = UIColor.black.cgColor
        cell.ibImageHolder
            .layer.cornerRadius  = 20
        return cell
    }
    
    
    //flowLayout delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:( ibHotelListTable.frame.width) - (ibHotelListTable.frame.width * 0.01) , height: 200)
    }
}

