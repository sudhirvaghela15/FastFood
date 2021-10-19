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
            termsAndConditions()
            tgPolicy()
            tgSignIn()
            
            view.layer.borderColor  = UIColor.systemGray3.cgColor
            view.layer.borderWidth  = 3.0
            view.layer.cornerRadius = 45
            navigationController?.navigationBar.isHidden = true
        }
    
//    MARK: Action
    @IBAction func btnsAction(_ sender: UIButton) {
    
        if sender.tag == 0 {
//            btn sing uo with email
            if btnCheckBox.isSelected{
                _SignUpWithEmail()
            }else{
//               
                let alert = Alert.shared.makeAlert(title: "Tearm and Condition",message: "Please Accept Tearm and Condition", controller: self)
                
                alert.addAction(
                    UIAlertAction(
                        title: "Accept", style: .default, handler:{ action in
                                self.checkboxToggle()
                                self._SignUpWithEmail()
                            }
                    )
                )
                alert.addAction(
                    UIAlertAction(
                        title: "cancle", style: .cancel, handler: { action in
                            self.resignFirstResponder()
                        }
                    ))
                self.present(alert, animated: true)
            }
            
        }else if sender.tag == 1 {
            //btn facebook
            facebookLogin()
            
        }else if sender.tag == 2 {
            //btn twitter
            twitterLogin()
        
        }else if sender.tag == 3 {
            //btn apple
            appleLogin()
        
        }else if sender.tag == 4 {
            //btn sign
            print("ss")
            _SignIn()
        }
    }
//    MARK: CHEKCBOX TOGGLE BUTTON
    @IBAction func btnCheckBoxAction(_ sender: UIButton) {
        checkboxToggle()
    }
    
    //    MARK: CUSTOM FUNCTIONs
    func _Design(){
        let fontSize:CGFloat           = view.frame.height * 0.0167
        logo.layer.cornerRadius        = logo.frame.size.height * 0.2
        btnCheckBox.layer.cornerRadius = 5
        btnCheckBox.layer.borderWidth  = 1.0
        btnCheckBox.layer.borderColor  = UIColor.black.cgColor
        btnCheckBox.tintColor          = UIColor.black
        
        for btn in btns{
            btn.clipsToBounds          = true
            btn.layer.cornerRadius     = btn.layer.frame.height * 0.2
            if btn.tag == 4{
                btn.titleLabel?.font   = btn.titleLabel?.font.withSize(fontSize)
            }
        }
        [lblSignIn,lblPolicy].forEach{
            $0.font = lblSignIn.font.withSize(fontSize)
        }
    }
    
    func termsAndConditions(){
        lblPolicy.numberOfLines = 0
        lblPolicy.text          =
            " I have read and agree to Fast Food's\n Privacy Policy. and Terms of Use."
    }
    
    private func checkboxToggle(){
        btnCheckBox.isSelected.toggle()
        if btnCheckBox.isSelected{
            print("accepted Terms And Conditions ")
        }else{
            print("Terms And Conditions not accept yet")
        }
    }
//  MARK: SIGN-UP WITH EMAIL BUTTON
    private func _SignUpWithEmail(){
        self.navigationController?
            .pushViewController(
                storyboard?.instantiateViewController(
                    withIdentifier: "SignUpWithEmail")
                    as! SignUpWithEmail, animated: true
            )
        print("Next OTP screen")
        
    }
//    MARK: LOGIN BUTTON
    private func _SignIn(){
        self.navigationController?
            .pushViewController(
                storyboard?.instantiateViewController(
                withIdentifier: "LoginVc")
                as! LoginVc, animated: true
            )
       
    }
//   MARK: SIGN-UP WITH BUTTONS
    private func facebookLogin(){
        checkboxToggle()
        Toast.shared.makeToast(message: "FaceBook", controller: self)
    }
    private func twitterLogin(){
        checkboxToggle()
        Toast.shared.makeToast(message: "Twitter", controller: self)
    }
    private func appleLogin(){
        checkboxToggle()
        Toast.shared.makeToast(message: "apple", controller: self)
    }
    
}

extension ViewController{
    
    func tgPolicy(){
        tap = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapLblPolicy))
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
    func didTapLblPolicy(){
        checkboxToggle()
    }
    
    @objc
    func tapSignIn(){
        _SignIn()
    }
}
