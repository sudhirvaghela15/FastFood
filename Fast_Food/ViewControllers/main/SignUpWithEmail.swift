//
//  SignUpWithEmail.swift
//  Fast_Food
//
//  Created by sudhir on 18/05/21.
//

import UIKit

class SignUpWithEmail: UIViewController {

    @IBOutlet weak var ibEmail: UITextField!
    @IBOutlet weak var ibPassword: UITextField!
    @IBOutlet weak var ibConfirmPassword: UITextField!
    @IBOutlet weak var ibSignUp: UIButton!
    @IBAction func btnSignUp(_ sender: UIButton){
        didTapSignUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _SetUpDesign()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureKeyboard()
    }
//    MARK: custom functions
    private func configureKeyboard(){
        ibEmail.delegate                = self
        ibPassword.delegate             = self
        ibConfirmPassword.delegate      = self
        ibEmail.returnKeyType           = .next
        ibPassword.returnKeyType        = .next
        ibConfirmPassword.returnKeyType = .done
    }
    private func _SetUpDesign(){
//        ibEmail._Padding(point: 10)
        ibEmail.layer.borderColor           = UIColor.black.cgColor
        ibPassword.layer.borderColor        = UIColor.black.cgColor
        ibConfirmPassword.layer.borderColor = UIColor.black.cgColor
        ibEmail.layer.borderWidth           = 1.0
        ibPassword.layer.borderWidth        = 1.0
        ibConfirmPassword.layer.borderWidth = 1.0
        ibEmail.layer.cornerRadius  = 10
        ibPassword.layer.cornerRadius  = 10
        ibConfirmPassword.layer.cornerRadius  = 10
        ibSignUp.layer.cornerRadius  = 10
        ibPassword._Padding(point: 10)
        ibConfirmPassword._Padding(point: 10)
        
        ibEmail._IconBtn(image: UIImage(systemName: "person.fill"), space: -10)
        ibPassword._IconBtn(image: UIImage(systemName: "eye.fill"), space: -10)
        ibConfirmPassword._IconBtn(image: UIImage(systemName: "eye.fill"), space: -10)
    }
//    MARK: SIGN UP BTN
    private func didTapSignUp(){
        
        if  !ibEmail.text!.isEmpty{
//            print(ibEmail.text!.count)
            if !ibPassword.text!.isEmpty{
//                print(ibPassword.text!.count)
                if !ibConfirmPassword.text!.isEmpty{
                    if ibPassword.text == ibConfirmPassword.text{
                        userName = ibEmail.text
                        password = ibConfirmPassword.text
                        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVc")as! LoginVc
                            vc.modalPresentationStyle = . fullScreen
                            present(vc, animated: true)
                    }else{
                        Toast.makeToast(message: "Password Does not match", controller: self) }
                }else{
                    Toast.makeToast(message: "Enter Confirm Password", controller: self) }
            }else{
                Toast.makeToast(message: "Enter Password", controller: self) }
        }else{
            Toast.makeToast(message: "Eneter Email Address", controller: self) }
    }
}

extension SignUpWithEmail: UITextFieldDelegate{
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == ibEmail{
            ibPassword.becomeFirstResponder()
        }else if textField == ibPassword{
            ibConfirmPassword.becomeFirstResponder()
        }else if textField == ibConfirmPassword {
            ibConfirmPassword.resignFirstResponder()
        }
        return true
    }
    
}
