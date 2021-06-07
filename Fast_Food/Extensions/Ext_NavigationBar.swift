//
//  NavigationBar.swift
//  Fast_Food
//
//  Created by sudhir on 20/05/21.
//

import UIKit
extension UIViewController{
//    arrow.backward
    func nav(navIcon: UIImage? = nil , navTitle: String? = nil){
      let navBar = UIView(frame: CGRect(x: -1, y: 0, width: self.view.frame.width + 2 , height: 70))
      let navBtn = UIButton(frame: CGRect(x: 10, y: (navBar.frame.height / 2 ) + 5 , width: 40, height: (navBar.frame.height / 2) - 10 ))
    
        if navIcon == nil {
            print("nil")
            navBtn.setTitle("Back", for: .normal)
            navBtn.setTitleColor(.black, for: .normal)
            
        }else if navIcon != nil{
            print("fill")
            navBtn.setBackgroundImage(navIcon, for: .normal)
        }
        
        if navTitle != nil {
            
            let lblTitle = UILabel()
            lblTitle.font = lblTitle.font.withSize(35)
            
            lblTitle.textAlignment = NSTextAlignment.center
            lblTitle.text = navTitle
            lblTitle.textColor = UIColor.black
            navBar.addSubview(lblTitle)
            lblTitle.frame = CGRect(x:  Int(navBar.frame.size.width/2) - 100, y: (Int(navBar.frame.size.height) / 2) - 2 , width: 200, height: 35)
        }
        
        navBar.backgroundColor = UIColor.clear
        navBar.layer.borderWidth = 0.5
        navBar.layer.borderColor = UIColor.orange.cgColor
        navBtn.layer.cornerRadius = 5
        navBtn.layer.borderColor = UIColor.orange.cgColor
        navBtn.layer.borderWidth = 0.5
        navBtn.tintColor = UIColor.black

//  MARK: target
        navBtn.addTarget(self, action: #selector(LastScreen), for: .touchUpInside)
        navBar.addSubview(navBtn)
        view.addSubview(navBar)
    }
    
    @objc
    private func LastScreen(){
        print("helo from navigation")
        self.view.backgroundColor = UIColor.gray
        self.navigationController?.popViewController(animated: true)
       
    
    }
}
