//
//  CellTableViewHome.swift
//  Fast_Food
//
//  Created by sudhir on 31/05/21.
//

import UIKit

class CellTableViewHome: UITableViewCell {
    //   MARK: Outlet
    @IBOutlet weak var hotelImage : UIImageView!
    @IBOutlet weak var hotelName    : UILabel!
    @IBOutlet weak var hotelRating : UITextField!
    @IBOutlet weak var hotelType: UILabel!
    @IBOutlet weak var hotelAddress : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        _Design()
        
        
        debugPrint(contentView.frame.height)
        debugPrint(hotelImage.frame.height)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    
    func _Design(){
        hotelImage.layer.cornerRadius = 20
        hotelImage.layer.borderWidth = 1.0
        hotelImage.layer.borderColor = UIColor.black.cgColor
        hotelRating.isUserInteractionEnabled = false
    
        hotelName.backgroundColor    = .clear
        hotelType.backgroundColor    = .clear
        hotelAddress.backgroundColor = .clear
        
        hotelRating._IconBtn(image: UIImage(systemName: "star"), space: 0, direction: "Left", width: 30, height: 30)
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1.0
        }
    
}
