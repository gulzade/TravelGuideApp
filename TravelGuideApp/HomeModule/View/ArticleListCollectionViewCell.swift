//
//  ArticleListCollectionViewCell.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 9.10.2022.
//

import UIKit

class ArticleListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var articlePhotoImageView: UIImageView!
    @IBOutlet weak var articleCategoryLabel: UILabel!
    @IBOutlet weak var articleTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCellUI(){
        articlePhotoImageView.layer.cornerRadius = 8
        articlePhotoImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cellView.layer.cornerRadius = 8
        cellView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
extension ArticleListCollectionViewCell {
    func addShadow(corner: CGFloat = 10, color: UIColor = UIColor(red: 0.094, green: 0.196, blue: 0.451, alpha: 0.1), radius: CGFloat = 15, offset: CGSize = CGSize(width: 0, height: 0), opacity: Float = 0.5) {
        let cell = self
        cell.contentView.layer.borderWidth = 0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = color.cgColor
        cell.layer.shadowOffset = offset
        cell.layer.shadowRadius = radius
        cell.layer.shadowOpacity = opacity
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
}
