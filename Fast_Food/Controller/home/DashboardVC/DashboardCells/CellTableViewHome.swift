//
//  CellTableViewHome.swift
//  Fast_Food
//
//  Created by sudhir on 31/05/21.
//

import UIKit

class CellTableViewHome: UITableViewCell {
    
    //   MARK: Outlet
    @IBOutlet private weak var hotelImage   : UIImageView!
    @IBOutlet private weak var hotelName    : UILabel!
    @IBOutlet private weak var hotelRating  : UITextField!
    @IBOutlet private weak var hotelType    : UILabel!
    @IBOutlet private weak var hotelAddress : UILabel!
    @IBOutlet private weak var subView      : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _Design()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func _Design(){
        hotelImage.layer.cornerRadius = 10
        hotelImage.layer.borderWidth  = 1.0
        hotelImage.layer.borderColor  = UIColor.black.cgColor
        hotelRating.isUserInteractionEnabled = false
    
        hotelName.backgroundColor    = .clear
        hotelType.backgroundColor    = .clear
        hotelAddress.backgroundColor = .clear
        
        hotelRating._IconBtn(image: UIImage(systemName: "star"), space: 0, direction: "Left", width: 30, height: 30)
        
        subView.layer.cornerRadius = 10
        subView.layer.borderColor  = UIColor.black.cgColor
        subView.layer.borderWidth  = 1.0
        }
    
    
    func dataBind(hotelData:HotelDetails){
        
        hotelImage.image  = hotelData.image
        hotelName.text    = hotelData.hotelNama
        hotelType.text    = hotelData.hotelType
        hotelAddress.text = hotelData.hotelAddress
    }
}
