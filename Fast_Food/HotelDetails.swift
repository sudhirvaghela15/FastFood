//
//  TableVc.swift
//  Fast_Food
//
//  Created by sudhir on 23/05/21.
//

import UIKit

struct HotelDetails {
    var image       :UIImage!
    var hotelNama   :String!
    var hotelRating :String!
   
    var hotelType   :String!
    var hotelAddress:String!
}

//class TableVc: UITableViewCell {
//    @IBOutlet weak var hotel_Image: UIImageView!
//    @IBOutlet weak var hotelName: UILabel!
//    @IBOutlet weak var hotelType: UILabel!
//    @IBOutlet weak var hotelAddress: UILabel!
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0))
//    }
//
//    func _Design(){
//        hotel_Image.layer.cornerRadius = 20
//        hotel_Image.layer.borderWidth = 1.0
//        hotel_Image.layer.borderColor = UIColor.black.cgColor
//
//        hotelName.backgroundColor    = .clear
//        hotelType.backgroundColor    = .clear
//        hotelAddress.backgroundColor = .clear
//        contentView.layer.cornerRadius = 10
//        contentView.layer.borderColor = UIColor.black.cgColor
//        contentView.layer.borderWidth = 1.0
//    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//         super.setSelected(selected, animated: animated)
//
//         if selected {
//
//            contentView.backgroundColor  = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1656568878)
//            contentView.layer.cornerRadius = 10
//         } else {
//
//            contentView.backgroundColor  = .systemBackground
//         }
//     }
//}
