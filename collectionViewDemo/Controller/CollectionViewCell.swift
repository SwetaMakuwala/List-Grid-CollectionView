//
//  CollectionViewCell.swift
//  collectionViewDemo
//
//  Created by Dhaval Dobariya on 11/05/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var myLable: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(labelName : String, imgName: String, countryName : String, capitalName: String) {
        self.backgroundColor = .yellow
        myLable.text = labelName
        countryLbl.text = countryName
        capitalLbl.text = capitalName
        myImg.contentMode = .scaleAspectFit
        myImg.clipsToBounds = false
        myImg.image = UIImage(named: imgName)
    }
}
