//
//  ItemMenuCell.swift
//  Fast_Food
//
//  Created by sudhir on 01/06/21.
//

import UIKit
class ItemMenuCell: UITableViewCell {
    
    @IBOutlet weak var subCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        collectionDelegate()
        collectionCellRegister()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func collectionDelegate(){
        subCollectionView.delegate = self
        subCollectionView.dataSource = self
    }
    
    func collectionCellRegister(){
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        subCollectionView.register(nib, forCellWithReuseIdentifier: "cell2")
    }
}


extension ItemMenuCell:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return catagoriesItem[subCollectionView.tag].itemSubName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)as! ItemCollectionViewCell
    
        
        cell.itemImage.image = UIImage(named: catagoriesItem[subCollectionView.tag].itemSubImage[indexPath.row])
        cell.itemName.text = catagoriesItem[subCollectionView.tag].itemSubName[indexPath.row]
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor
        
    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        print(catagoriesItem[subCollectionView.tag].itemSubName[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: (subCollectionView.frame.size.width - 10) / 2, height: (subCollectionView.frame.size.height - 10) / 2)
    }
    
}
