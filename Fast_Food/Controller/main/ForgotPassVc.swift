//
//  ForgotPassVc.swift
//  Fast_Food
//
//  Created by sudhir on 23/05/21.
//

import UIKit

//MARK: FORGOT VIEW-CONTROLLER
class ForgotPassVc: UIViewController {
    
    @IBOutlet weak var tvEmail  : UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBAction func btnSubmit(_ sender: UIButton) {
        didTapSubmit()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        _Design()
    }
    private func _Design(){
        tvEmail.layer.cornerRadius        = 10
        tvEmail.layer.borderColor         = UIColor.black.cgColor
        btnSubmit.layer.cornerRadius       = 10
        tvEmail.layer.borderWidth         = 1.0
        tvEmail._IconBtn(image: UIImage(systemName: "person.fill"), space: -10)
        btnSubmit.layer.cornerRadius          = 10
        btnSubmit.layer.borderWidth           = 1.0
        btnSubmit.layer.borderColor           = UIColor.black.cgColor

    }
    private func didTapSubmit(){
        self.navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "EmailVerify")as! EmailVerify, animated: true)
    }
}

//MARK: EMAIL VERIFY VIEW CONTROLLER
class EmailVerify: UIViewController{
    
    @IBOutlet weak var tvOtp  : UITextField!
    @IBOutlet weak var btnVerify: UIButton!
    @IBAction func btnVerify(_ sender: UIButton){
        didTapVerify()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _Design()
    }
    private func _Design(){
        tvOtp.layer.cornerRadius          = 10
        tvOtp.layer.borderWidth           = 1.0
        tvOtp.layer.borderColor           = UIColor.black.cgColor
        btnVerify.layer.cornerRadius      = 10
        btnVerify.layer.borderWidth       = 1.0
        btnVerify.layer.borderColor       = UIColor.black.cgColor
        tvOtp._IconBtn(image: UIImage(named: "otp"), space: -10)
        
    }
    private func didTapVerify(){
        print("verif")
        self.navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "ChangePassword")as! ChangePassword, animated: true)
    }
}

//MARK: CHANGE PASSWORD VIEW CONTROLLER
class ChangePassword: UIViewController{
    
    @IBOutlet weak var tvNewPassword: UITextField!
    @IBOutlet weak var tvConfirmPassword: UITextField!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBAction func tapButton(){
        passwordUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _Design()
    }
    
    private func _Design(){
    
        tvNewPassword.borderStyle            = .none
        tvNewPassword.layer.borderWidth      = 1.0
        tvNewPassword.layer.borderColor      = UIColor.black.cgColor
        tvNewPassword.layer.cornerRadius     = 10
        tvConfirmPassword.borderStyle        = .none
        tvConfirmPassword.layer.borderWidth  = 1.0
        tvConfirmPassword.layer.borderColor  = UIColor.black.cgColor
        tvConfirmPassword.layer.cornerRadius = 10
        btnUpdate.layer.borderWidth          = 1.0
        btnUpdate.layer.borderColor          = UIColor.white.cgColor
        btnUpdate.layer.cornerRadius         = 10
        tvNewPassword._IconBtn(image: UIImage(systemName: "eye.fill"), space: -10)
        tvConfirmPassword._IconBtn(image: UIImage(systemName: "eye.fill"), space: -10)
    }
    private func passwordUpdate(){
        let vc  = (storyboard?.instantiateViewController(identifier: "LoginVc")as! LoginVc)
            vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
}
