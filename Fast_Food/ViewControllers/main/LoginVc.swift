//
//  LoginVc.swift
//  Fast_Food
//
//  Created by sudhir on 18/05/21.
//

import UIKit

class LoginVc: UIViewController {
    
    @IBOutlet weak var ibLoginEmail: UITextField!
    @IBOutlet weak var ibLoginPassword: UITextField!
    @IBOutlet weak var ibLoginBtn: UIButton!
    @IBOutlet weak var ibForgotTap: UILabel!
    
    @IBAction func LoginBtn(_ sender: UIButton) {
        _Login()
    }
//MARK: Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        _SetDesign()
        _SetTapGesture()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureKeyboard()
    }
    private func _SetDesign(){
        
        ibLoginEmail.layer.cornerRadius     = 10
        ibLoginPassword.layer.cornerRadius  = 10
        ibLoginEmail.layer.borderWidth      = 1.0
        ibLoginPassword.layer.borderWidth   = 1.0
        ibLoginEmail.layer.borderColor      = UIColor.black.cgColor
        ibLoginPassword.layer.borderColor   = UIColor.black.cgColor
        ibLoginEmail._IconBtn(image: UIImage(systemName: "person.fill"), space: -10)
        ibLoginPassword._IconBtn(image: UIImage(systemName: "eye.fill"), space: -10)
        ibLoginBtn.layer.cornerRadius = 10
    }
    private func configureKeyboard(){
        ibLoginEmail.delegate          = self
        ibLoginPassword.delegate       = self
        ibLoginEmail.returnKeyType     = .next
        ibLoginPassword.returnKeyType  = .done
    }
    
    private func _Login(){
        
        if !ibLoginEmail.text!.isEmpty {
            if ibLoginEmail.text == userName{
                if !ibLoginPassword.text!.isEmpty {
                    if ibLoginPassword.text == password {
                        
                        
                        let sb = UIStoryboard(name: "Home", bundle: nil)
                        let vc = sb.instantiateViewController(identifier: "HomeViewController")as! HomeViewController
//                        let nv = UINavigationController(rootViewController: vc)
                        self.navigationController?.pushViewController(vc, animated: true)
                    
                        Toast.makeToast(message: "Login", controller: self)
                    }else{ Toast.makeToast(message: "Enter Valid Details", controller: self) }
                }else{ Toast.makeToast(message: "Enter Password", controller: self) }
            }else{ Toast.makeToast(message: "UsetName Not Match", controller: self)}
        }else{ Toast.makeToast(message: "Enter UserName", controller: self) }
    }
}

//  MARK: Login Extension for forgot tap gesture
extension LoginVc{
    private func _SetTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tgForgot))
        ibForgotTap.isUserInteractionEnabled = true
        ibForgotTap.addGestureRecognizer(tap)
    }
    @objc
    private func tgForgot(){
        let storyboardId = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboardId.instantiateViewController(identifier: "ForgotPassVc") as! ForgotPassVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: TEXTFIELD EXTENTION
extension LoginVc: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        if textField == ibLoginEmail {
            ibLoginPassword.becomeFirstResponder()
        }else if textField == ibLoginPassword {
            ibLoginPassword.resignFirstResponder()
        }
        return true
    }
}
