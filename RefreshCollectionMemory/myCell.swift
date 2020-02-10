//
//  myCellCollectionViewCell.swift
//  RefreshCollectionMemory
//
//  Created by Larry Mcdowell on 2/9/20.
//  Copyright © 2020 Larry Mcdowell. All rights reserved.
//

import UIKit

class myCell: UICollectionViewCell {
    var text:String? { didSet{
        myLabel.text = text
        
        }}
     var myLabel: UILabel = {
       let lb = UILabel()
        lb.textAlignment = .center
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.layer.cornerRadius = 5
       
        return lb
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
