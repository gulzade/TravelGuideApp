//
//  HotelListTableViewCell.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import UIKit

class HotelListTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelView: UIView!
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelCountry: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    func setupUIHotelCell(){
        
        hotelImageView.clipsToBounds = true
        hotelImageView.layer.cornerRadius = 10
        hotelImageView.layer.cornerRadius = 10
        hotelImageView.clipsToBounds = true
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = false
        let margins = UIEdgeInsets(top:10, left: 10, bottom:10, right: 10)
        contentView.frame = contentView.frame.inset(by: margins)
        
        contentView.clipsToBounds = false
        contentView.layer.cornerRadius = 10
        
        contentView.layer.shadowColor = UIColor(red: 0.094, green: 0.196, blue: 0.451, alpha: 0.1).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize(width:0.3, height: 0.3)
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 10).cgPath
    }
}
