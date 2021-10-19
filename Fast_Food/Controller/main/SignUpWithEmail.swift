//
//  SignUpWithEmail.swift
//  Fast_Food
//
//  Created by sudhir on 18/05/21.
//

import UIKit

class SignUpWithEmail: UIViewController {

//    MARK:- Outlets
    @IBOutlet weak var lblHello          : UILabel!
    @IBOutlet weak var lblAmp            : UILabel!
    @IBOutlet weak var lblwelcome         : UILabel!
    @IBOutlet weak var txtQuotes         : UITextView!
    
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
        let welcomeTextSize   :CGFloat = view.frame.height *  0.0602
        let txtQuotesTextSize :CGFloat = view.frame.height * 0.0189
        [lblwelcome,lblAmp,lblHello].forEach{
            $0?.font = $0?.font.withSize(welcomeTextSize)
        }
        txtQuotes.font = txtQuotes.font?.withSize(txtQuotesTextSize)
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
        let request = SignUpRequest(userEmail: ibEmail.text!, userPassword: ibPassword.text!, userConfirmPassword: ibConfirmPassword.text!)
        let validation = SignUpValidation()
        
        let result = validation.validate(request: request)
        
        if(result.success){
        
            let LoginVc = UINavigationController(
                rootViewController: UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "LoginVc")as! LoginVc)
                LoginVc.modalPresentationStyle =
                    .fullScreen
                LoginVc.navigationController?
                    .isNavigationBarHidden = true
        
           self.navigationController?.present(LoginVc, animated: true)

        }else{
            Toast.shared.makeToast(message: "\(result.errorMessage ?? "")", controller: self)
        }
       
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
