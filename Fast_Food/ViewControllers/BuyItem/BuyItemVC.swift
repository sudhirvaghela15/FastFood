//
//  ButItemVC.swift
//  Fast_Food
//
//  Created by sudhir on 14/06/21.
//

import UIKit

class BuyItemVC: UIViewController {
    
    var image:UIImage!
    
    @IBOutlet weak var imgHolder: UIImageView!
    @IBOutlet weak var buyBtn   : UIButton!
    @IBOutlet weak var cardBtn  : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurationView()
    }
    
    private func configurationView(){
        
        
        imgHolder.image = image
        imgHolder.layer.cornerRadius  = 20
        imgHolder.layer.borderWidth   = 1
        imgHolder.layer.borderColor   = UIColor.black.cgColor
        
        buyBtn.setTitle("Buy", for: .normal)
        buyBtn.setTitleColor(UIColor.white, for: .normal)
        buyBtn.backgroundColor = .black
        
        cardBtn.setTitle("Add To Cart", for: .normal)
        cardBtn.setTitleColor(UIColor.white, for: .normal)
        cardBtn.backgroundColor = .black
        
    }

}
