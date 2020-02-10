//
//  MyCollectionViewCell.swift
//  RefreshCollectionMemory
//
//  Created by Larry Mcdowell on 2/9/20.
//  Copyright © 2020 Larry Mcdowell. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var text:String?{
           didSet{
               nameLabel.text = text!
           }}
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           nameLabel.translatesAutoresizingMaskIntoConstraints = false
           addSubview(nameLabel)
           nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
           nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
           nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
           nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
           
           
       }

           var nameLabel:UILabel =
           {
               var lbl = UILabel()
               lbl.font = UIFont(name: "GillSans", size: 20)
               lbl.layer.cornerRadius = 8
               lbl.layer.borderWidth = 3
               lbl.layer.borderColor = UIColor.black.cgColor
               lbl.textAlignment = .center
               return lbl
           }()
           
       
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
