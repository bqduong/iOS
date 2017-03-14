//
//  MenuBar.swift
//  tipCalc
//
//  Created by BD & LN on 3/12/17.
//  Copyright © 2017 BD & LN. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //cv.backgroundColor = UIColor(colorLiteralRed: 81/255, green: 169/255, blue: 90/255, alpha: 1)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self;
        cv.delegate = self;
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["oneStar", "twoStars", "threeStars"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(TipPercentageCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = NSIndexPath(row: 1, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TipPercentageCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        
        cell.tintColor = UIColor.gray
        
        return cell
    }
    
    func loadSavedDefaultValue(index: Int) {
        let selectedIndexPath = NSIndexPath(row: index, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //override func viewDidAppear(_ animated: Bool) {
    //    loadDefaultTipPercentages()
    //}
    
    //func loadDefaultTipPercentages() {
    //let defaults = UserDefaults.standard
    //    let tipPercentageIndex = defaults.integer(forKey: "defaultTipPercentageIndex")

    //    let selectedIndexPath = NSIndexPath(row: tipPercentageIndex, section: 0)
    //    collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
    //}
}

class TipPercentageCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "nav_more")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.darkGray
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.red : UIColor.darkGray
        }
    }
    
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? UIColor.red : UIColor.darkGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        addConstraintsWithFormat("H:[v0(28)]", views: imageView)
        addConstraintsWithFormat("V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
