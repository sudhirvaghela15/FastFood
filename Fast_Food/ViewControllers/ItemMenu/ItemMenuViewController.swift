//
//  ItemMenuViewController.swift
//  Fast_Food
//
//  Created by sudhir on 01/06/21.
//

import UIKit

class ItemMenuViewController: UIViewController {
    
   
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableCell()
        customTableView.delegate = self
        customTableView.dataSource = self
    }
    private func registerTableCell(){
        let nib = UINib(nibName: "ItemMenuCell", bundle: nil)
        customTableView.register(nib, forCellReuseIdentifier: "cell")
    }
}

extension ItemMenuViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return catagoriesItem.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return catagoriesItem[section].categorie
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! ItemMenuCell
        cell.delegate = self
        cell.subCollectionView.tag = indexPath.section
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.layer.cornerRadius = 10
        view.tintColor = .orange
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Toast.makeToast(message: "Hello From itemTable", controller: self)
    }
    
}

// MARK : item cell delegate

//it's handle Collection View didSelectItemAt Index and navigate to next view controller
extension ItemMenuViewController: ItemCellDelegate{
    
    func itemClicked(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("item index :\(indexPath.row)")
        print("item name :\(catagoriesItem[collectionView.tag].itemSubName[indexPath.row]),tag: \(collectionView.tag)")
        
        let sb = UIStoryboard(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "BuyItemVC")as! BuyItemVC
        
        vc.title = catagoriesItem[collectionView.tag].itemSubName[indexPath.row]
        
        vc.image = UIImage(named: catagoriesItem[collectionView.tag].itemSubImage[indexPath.row])
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
