//
//  DVC_Extention.swift
//  Fast_Food
//
//  Created by sudhir on 03/08/21.
//

import Foundation
import UIKit


//MARK: SideBarMenu Viewcontroller delegate
extension DashboardViewController:
    SideBarViewControllerDelegate{
    
    func didTapMenu(MenuOption: SideBarMenuOption) {
        //set navBar title
        navigationItem.title = MenuOption.rawValue
        topView?.removeFromSuperview()
        
        guard
              let account =
                storyboard?.instantiateViewController(
                    withIdentifier: "AccountViewController")
                as? AccountViewController ,
              let review =
                storyboard?.instantiateViewController(
                    withIdentifier: "OrderViewController")
                as? OrderViewController ,
              let settings =
                storyboard?.instantiateViewController(
                    withIdentifier: "MyFavListViewController")
                as? MyFavListViewController
              else{
            fatalError()
        }
        
    switch MenuOption {
        case .home:
//           print("home")
            topView = nil
           
        case .account:
            print("accout")
            addChild(account)
            topView = account.view
//            topView?.removeFromSuperview()
//            account?.removeFromParent()
        case .order:
//            print("Your Orders")
            topView = review.view
            
        case .yourFavList:
//            print("YouFavList")

            topView = settings.view
            
        case .logout:
            print("logout")
        }
        topView != nil ? view.addSubview(topView!) : nil
    }
}
