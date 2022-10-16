//
//  ViewController.swift
//  collectionViewDemo
//
//  Created by Dhaval Dobariya on 11/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var items = ["1", "2", "3", "4", "5"]
    var imagesOfItems = ["img1", "img2", "img3", "img4", "img5" ]
    var countryName = ["India", ""]
    var capitalName = [""]
    var toChange = true
    let jsonManager = JsonManager()
    var dataToFill : [DetailsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       setup()
    }
    func setup(){
        myCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        myCollectionView.register(UINib(nibName: "CollectionViewCellListView", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellListView")
        if let data = jsonManager.getUsersList(){
            dataToFill = data
        }
        for i in dataToFill{
            print(i.countryName)
            print(i.capitalName)
        }
    }

    @IBAction func changeBtnPressed(_ sender: UIButton) {
        toChange = !toChange
        myCollectionView.reloadData()
    }
    
}
//MARK: - collectionViewDataSource & delegate
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if toChange {
            var cell = CollectionViewCell()
            if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
                myCell.configureCell(labelName: items[indexPath.item], imgName: imagesOfItems[indexPath.item], countryName: dataToFill[indexPath.item].countryName, capitalName: dataToFill[indexPath.item].capitalName)
                //labelName : String, imgName: String, countryName : String, capitalName: String
                cell = myCell
            }
            return cell
        }else {
            
            var cell = CollectionViewCellListView()
            if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellListView", for: indexPath) as? CollectionViewCellListView {
                myCell.configurecell(name: items[indexPath.item], imageName: imagesOfItems[indexPath.item], countryname: dataToFill[indexPath.item].countryName, capitalName: dataToFill[indexPath.item].capitalName)
                cell = myCell
            }
            return cell
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you selected \(indexPath.item)th cell")
    }
    
}

// MARK: - collectionView  layout delegate
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if toChange {
            let width = (collectionView.bounds.width - 10) / 2
                   let height = width
                   return CGSize(width: width, height: height + 20)
           // return CGSize(width: 50.0, height: 100.0)
        }else {
            
            let width = self.view.frame.size.width;
            let height = 80.0
            
            return CGSize(width: width, height: height)
        }

    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
//    {
//
//
//            let sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//            return sectionInset
//
//    }
}
