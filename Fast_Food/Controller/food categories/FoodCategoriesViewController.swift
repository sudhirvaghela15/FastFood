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
    
    //cellforRow
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create dequeueReusableCell
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "FoodCategoriesCell",
                                          for: indexPath)as! FoodCategoriesCell
        //set delegate for collection item (cell)
        cell.delegate = self
        //set every cell collection tags using table cell index
        cell.foodItemCollectionView.tag
                      = indexPath.section
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

