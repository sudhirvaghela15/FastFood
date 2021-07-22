//
//  ItemMenuViewController.swift
//  Fast_Food
//
//  Created by sudhir on 01/06/21.
//

import UIKit

class FoodCategoriesViewController: UIViewController {

    static let identifier = "FoodCategoriesViewController"
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customTableView.register(
            UINib(nibName: "FoodCategoriesCell", bundle: nil),
            forCellReuseIdentifier: "FoodCategoriesCell"
        )
        customTableView.delegate   = self
        customTableView.dataSource = self
    }
}

extension FoodCategoriesViewController:
    UITableViewDelegate,
    UITableViewDataSource{

    //data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return catagories.count
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
    
        return catagories[section].itemName
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FoodCategoriesCell", for: indexPath)
            as! FoodCategoriesCell
        cell.delegate = self   //set delegate for onClick Event
        cell.foodItemCollectionView.tag
                      = indexPath.section  // set every cell collection tags using table cell index
        return cell
    }
    
    //delegate
    func tableView(_ tableView: UITableView,
                   willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        view.layer.cornerRadius = 10
        view.tintColor = .orange
    }
}

// MARK : Food Categories cell delegate

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
