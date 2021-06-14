//
//  CartViewController.swift
//  Fast_Food
//
//  Created by sudhir on 28/05/21.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var ibPopup: UIButton!
    
    @IBAction func didCloseCartPopUp(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
        resizeView()
      
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        design()
    }
    private func design(){
        ibPopup.layer.cornerRadius = 2
        ibPopup.layer.borderColor = UIColor.red.cgColor
        ibPopup.layer.borderWidth = 2.0
    }
    private func resizeView(){
        
    }
}




