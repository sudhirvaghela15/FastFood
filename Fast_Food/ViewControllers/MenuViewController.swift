//
//  MenuViewController.swift
//  Fast_Food
//
//  Created by sudhir on 27/05/21.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func didTapMenu(MenuItem: MenuViewController.MenuOption)
}


class MenuViewController: UIViewController{
    
    weak var delegate :MenuViewControllerDelegate?
    

    enum MenuOption: String,CaseIterable{
        case home      = "Home"
        case account   = "Account"
        case order     = "Your Order"
        case yourFavList  = "Your Fav List"
        case logout    = "Logout"
        
        var imageName: String{
            switch self{
            case .home:
                return "homekit"
            case .account:
                return "person"
            case .order:
                return "star"
            case .yourFavList:
                return "heart"
            case .logout:
                return "pip.exit"
            }
        }
    }
    
    private let tableView1:UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //add table in menubar
        tableView1.delegate = self   //table view delegate
        tableView1.dataSource = self //tableview datasource
        tableView1.separatorStyle = .none
        tableView1.backgroundColor = .black
        
        view.addSubview(tableView1)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView1.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID",for: indexPath)
        let obj = MenuOption.allCases[indexPath.row]
            cell.imageView?.image = UIImage(systemName:obj.imageName)
            cell.textLabel?.text = obj.rawValue
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
            cell.tintColor = .white
            cell.textLabel?.font = cell.textLabel?.font?.withSize(20)
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let obj = MenuOption.allCases[indexPath.row]
        delegate?.didTapMenu(MenuItem: obj)
    }
    
}
