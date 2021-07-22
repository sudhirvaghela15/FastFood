//
//  MenuViewController.swift
//  Fast_Food
//
//  Created by sudhir on 27/05/21.
//

import UIKit

//Mark: Delegate
protocol SideBarViewControllerDelegate: AnyObject {
    func didTapMenu(MenuOption: SideBarMenuOption)
}

class SideBarViewController: UIViewController{
    
    weak var delegate :SideBarViewControllerDelegate? //delegate
    
    //tableView
    private let tableView1:UITableView = {
        let table = UITableView()
        table.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView1.delegate         = self
        tableView1.dataSource       = self  
        tableView1.separatorStyle   = .none
        tableView1.backgroundColor  = .black
        
        view.addSubview(tableView1)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView1.frame = view.bounds
//        CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height)
    }
}

extension SideBarViewController:
    UITableViewDelegate,
    UITableViewDataSource{
   
    //data source
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return SideBarMenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath)
        
        let obj = SideBarMenuOption.allCases[indexPath.row]
            cell.imageView?.image     = UIImage(systemName:obj.imageName)
            cell.textLabel?.text      = obj.rawValue
            cell.backgroundColor      = .black
            cell.textLabel?.textColor = .white
            cell.tintColor            = .white
            cell.textLabel?.font      = cell.textLabel?.font?.withSize(20)
            
        return cell
    }
    //delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dismiss(animated: true, completion: nil)
//        let obj = SideBarMenuOption.allCases[indexPath.row]
        delegate?.didTapMenu(
            MenuOption: SideBarMenuOption.allCases[indexPath.row]
        )
    }
}
