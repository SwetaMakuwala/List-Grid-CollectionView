//
//  CollectionViewCellListView.swift
//  collectionViewDemo
//
//  Created by Dhaval Dobariya on 11/05/22.
//

import UIKit

class CollectionViewCellListView: UICollectionViewCell {

    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var myLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func configurecell(name: String, imageName: String, countryname: String , capitalName: String){
        self.backgroundColor = .lightGray
        myImg.image = UIImage(named: imageName)
        myLbl.text = name
        countryLbl.text = countryname
        capitalLbl.text = capitalName
        
    }
}
