//
//  AccountViewController.swift
//  Fast_Food
//
//  Created by sudhir on 27/05/21.
//
import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet var tvCollection: [UITextField]!
    @IBOutlet var btnCollection: [UIButton]!
    @IBOutlet weak var ibview: UIView!
    
    @IBAction func btnAction(_ sender: UIButton){
        
        if sender.tag == 0 || sender.tag == 1{
            btnCollection.forEach{$0 .isSelected = false}
        }
        
        sender.isSelected  = !sender.isSelected
        
        if sender.tag == 0 {
            print("Male")
            configureSelectGender(sender: sender)
            configureDeselectGender(btn: btnCollection[1])
            
        }else if sender.tag == 1{
            
            print("Female")
            configureSelectGender(sender: sender)
            configureDeselectGender(btn: btnCollection[0])
        }
        
    
}
    
    @IBAction func btnSubmit(_ sender: Any) {
        debugPrint("hellop from accout")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDesign()
    }
    private func configureDesign(){
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        cardView.layer.cornerRadius = 20
        ibview.layer.borderWidth = 1.0
        ibview.layer.borderColor = UIColor.black.cgColor
        ibview.layer.cornerRadius = 10
       
        for btn in btnCollection{
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.cornerRadius = 10
            btn.backgroundColor  = .black
        }
        
        for num in tvCollection{
            num.layer.borderWidth = 1.0
            num.layer.borderColor = UIColor.black.cgColor
            num._Padding(point: 10)
            num.layer.cornerRadius = 10
            
        }
    }
    private func configureSelectGender(sender: UIButton){
        sender.backgroundColor = .link
        sender.tintColor = .clear
        sender.setTitleColor(.black, for: .selected)
        sender.layer.borderWidth = 2.0
        sender.layer.borderColor = UIColor.black.cgColor
    }
    private func configureDeselectGender(btn:UIButton){
        btn.backgroundColor = .black
        btn.tintColor = .clear
        btn.setTitleColor(.white, for: .selected)
        btn.layer.borderWidth = 2.0
        btn.layer.borderColor = UIColor.white.cgColor
    }
}

