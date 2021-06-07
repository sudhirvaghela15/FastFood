//
//  Extension_Textfield.swift
//  Fast_Food
//
//  Created by sudhir on 18/05/21.
//

import UIKit

extension UITextField {
        
    func _Padding(point: Int , direction: String = "Left"){
        if direction == "Left"{
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: point, height: Int(self.frame.size.height)))
            self.leftView = padding
            self.leftViewMode = .always
        }else if direction == "Right"{
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: point, height: Int(self.frame.size.height)))
            padding.backgroundColor = UIColor.black
            self.rightView = padding
            self.rightViewMode = .always
        }
    }//over padding
    
    func _IconBtn(image: UIImage!, space: Int, direction: String = "Right", width: Int = 30, height: Int = 20){
        let y = (Int(self.frame.size.height) / 2) - height / 2
        
        if direction == "Right"{
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: Int(self.frame.size.height)))
            let iconBtn = UIButton(frame: CGRect(x: space, y: Int(y), width: width, height: height))
            iconBtn.setBackgroundImage(image, for: .normal)
            iconBtn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
//            iconBtn.backgroundColor = UIColor.green
//            view.backgroundColor = UIColor.gray
            
            view.addSubview(iconBtn)
            self.rightView = view
            self.rightViewMode = .always
            
        }else if direction == "Left"{
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width + space, height: Int(self.frame.size.height)))
            let iconBtn = UIButton(frame: CGRect(x: space, y: Int(y), width: width, height: height))
//            iconBtn.backgroundColor = UIColor.green
//            view.backgroundColor = UIColor.gray
            iconBtn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            iconBtn.setBackgroundImage(image, for: .normal)
            iconBtn.tintColor = UIColor.black
            view.addSubview(iconBtn)
            
            self.leftView = view
            self.leftViewMode = .always
        }
    }//over Icon
}

