//
//  SignUpWithEmail.swift
//  Fast_Food
//
//  Created by sudhir on 18/05/21.
//

import UIKit

class SignUpWithEmail: UIViewController {

//    MARK:- Outlets
    @IBOutlet weak var ibEmail           : UITextField!
    @IBOutlet weak var ibPassword        : UITextField!
    @IBOutlet weak var ibConfirmPassword : UITextField!
    @IBOutlet weak var ibSignUp          : UIButton!
//    MARK:- Action
    @IBAction func btnSignUp(_ sender: UIButton){
        didTapSignUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _SetUpDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?
            .setNavigationBarHidden(false,
                                    animated: animated)
        navigationController?.hidesBarsOnSwipe = false
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
        ibEmail.layer.borderColor            = UIColor.black.cgColor
        ibPassword.layer.borderColor         = UIColor.black.cgColor
        ibConfirmPassword.layer.borderColor  = UIColor.black.cgColor
        ibEmail.layer.borderWidth            = 1.0
        ibPassword.layer.borderWidth         = 1.0
        ibConfirmPassword.layer.borderWidth  = 1.0
        ibEmail.layer.cornerRadius           = 10
        ibPassword.layer.cornerRadius        = 10
        ibConfirmPassword.layer.cornerRadius = 10
        ibSignUp.layer.cornerRadius          = 10
        ibPassword._Padding(point: 10)
        ibConfirmPassword._Padding(point: 10)
        
        ibEmail._IconBtn(
            image: UIImage(systemName: "person.fill"),
            space: -10)
        ibPassword._IconBtn(
            image: UIImage(systemName: "eye.fill"),
            space: -10)
        ibConfirmPassword._IconBtn(
            image: UIImage(systemName: "eye.fill"),
            space: -10)
    }
//    MARK: SIGN UP BTN
    private func didTapSignUp(){
        
        if  ibEmail.text!.isValidEmail(){
            if !ibPassword.text!.isEmpty{
                if !ibConfirmPassword.text!.isEmpty{
                    if ibPassword.text == ibConfirmPassword.text{
                        userName = ibEmail.text!
                        password = ibConfirmPassword.text!
//                        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVc")as! LoginVc
//
//                        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(tapNav))
//
//                        navigationController?.setNavigationBarHidden(true, animated: true)
//                        navigationController?.hidesBarsOnSwipe = true
//
//                        self.navigationController?.pushViewController(vc, animated: true)
//
                        let st = UIStoryboard(name: "Main", bundle: nil)
                        let navVc = UINavigationController(rootViewController: st.instantiateViewController(withIdentifier: "LoginVc"))
                        navVc.modalPresentationStyle = .fullScreen
                        navVc.navigationController?.isNavigationBarHidden = true
                        
                        self.navigationController?.present(navVc, animated: true)
                        
                    }else{
                        Toast.shared.makeToast(message: "Password Does not match", controller: self) }
                }else{
                    Toast.shared.makeToast(message: "Enter Confirm Password", controller: self) }
            }else{
                Toast.shared.makeToast(message: "Enter Password", controller: self) }
        }else{
            Toast.shared.makeToast(message: "Eneter Email Address", controller: self) }
    }
//    @objc func tapNav(){
//        //code for back to first view
//
//    }
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