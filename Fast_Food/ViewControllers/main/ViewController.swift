//
//  ViewController.swift
//  Fast_Food
//
//  Created by sudhir on 11/05/21.
//

import UIKit

var userName:String = "sudhirvaghela15@gmail.com"
var password:String = "sudhir"

class ViewController: UIViewController {
    var tap: UITapGestureRecognizer!

//    MARK: outlet
    @IBOutlet weak var logo        : UIImageView!
    @IBOutlet var btns             : [UIButton]!
    @IBOutlet weak var lblPolicy   : UILabel!
    @IBOutlet weak var lblSignIn   : UILabel!
    @IBOutlet weak var btnCheckBox : UIButton!
    //    MARK: Did load
        override func viewDidLoad() {
            super.viewDidLoad()
            
            _Design()
            termAndPolicy()
            tgPolicy()
            tgSignIn()
            
            view.layer.borderColor = UIColor.systemGray3.cgColor
            view.layer.borderWidth = 3.0
            view.layer.cornerRadius = 45
        }
    
//    MARK: Action
    @IBAction func btnsAction(_ sender: UIButton) {
    
        if sender.tag == 0 {
//            btn sing uo with email
            if btnCheckBox.isSelected{
                _SignUpWithEmail()
            }else{
//               
               let alert = Alert.makeAlert(title: "Tearm and  Condition",message: "Please Accept Tearm and Condition", controller: self)
                
                Alert.alertDone(buttonTitle: "Accept")
                Alert.alertCancel(buttonTitle: "Close")
                Alert.delegate = self
                self.present(alert, animated: true)
            }
            
        }else if sender.tag == 1 {
//            btn sign in with facebook
            facebookLogin()
            
        }else if sender.tag == 2 {
//            btn sign in with twitter
            twitterLogin()
        
        }else if sender.tag == 3 {
//            btn sign in with apple
            appleLogin()
        
        }else if sender.tag == 4 {
//            btn sign in with created id
            _SignIn()
        }
    }
//    MARK: CHEKCBOX TOGGLE BUTTON
    @IBAction func btnCheckBoxAction(_ sender: UIButton) {
        checkboxToggle()
    }
    
    //    MARK: CUSTOM FUNCTIONs
    func _Design(){
        logo.layer.cornerRadius = logo.frame.size.height / 2
        
        for btn in btns{
            btn.clipsToBounds = true
            btn.layer.cornerRadius = 10
        }
        btnCheckBox.layer.cornerRadius = 5
        btnCheckBox.layer.borderWidth = 1.0
        btnCheckBox.layer.borderColor = UIColor.black.cgColor
        btnCheckBox.tintColor = UIColor.black
    }//over radius
    func termAndPolicy(){
        lblPolicy.numberOfLines = 0
        lblPolicy.text = " I have read and agree to Fast Food's\n Privacy Policy. and Terms of Use."
    }
    
    private func checkboxToggle(){
        btnCheckBox.isSelected.toggle()
        if btnCheckBox.isSelected{
            print("accepted policy")
        }else{
            print("policy not accept yet")
        }
    }
//  MARK: SIGN-UP WITH EMAIL BUTTON
    private func _SignUpWithEmail(){
        
        debugPrint("tag 1 : button sign uo with email")
        self.navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "SignUpWithEmail")as! SignUpWithEmail, animated: true)
        print("Next OTP screen")
        
    }
//    MARK: LOGIN BUTTON
    private func _SignIn(){
        self.navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "LoginVc") as! LoginVc, animated: true)
    }
//   MARK: SIGN-UP WITH BUTTONS
    private func facebookLogin(){
        checkboxToggle()
        Toast.makeToast(message: "FaceBook", controller: self)
    }
    private func twitterLogin(){
        checkboxToggle()
        Toast.makeToast(message: "Twitter", controller: self)
    }
    private func appleLogin(){
        checkboxToggle()
        Toast.makeToast(message: "apple", controller: self)
    }
    
}

extension ViewController{
    
    func tgPolicy(){
        
        tap = UITapGestureRecognizer(target: self, action: #selector(tapLblPolicy))
        lblPolicy.isUserInteractionEnabled = true
        lblPolicy.addGestureRecognizer(tap)
    }
    
    private func tgSignIn(){
        tap = UITapGestureRecognizer(target: self, action: #selector(tapSignIn))
        lblSignIn.addGestureRecognizer(tap)
        lblSignIn.isUserInteractionEnabled = true
    }
    
    //  MARK:  GESTURE EVENTs
    @objc
    func tapLblPolicy(){
        checkboxToggle()
    }
    
    @objc
    func tapSignIn(){
        _SignIn()
    }
}

//MARK: Alert Targets
extension ViewController: AlertDelegate{
    func setDoneHandler() {
        self.checkboxToggle()
        self._SignUpWithEmail()
    }
    
    func setCancelHandler() {
        self.resignFirstResponder()
    }
}
