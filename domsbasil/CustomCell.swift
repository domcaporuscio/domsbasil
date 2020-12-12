//
//  CustomCell.swift
//  domsbasil
//
//  Created by Dominic Caporuscio on 12/12/20.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell {
    
//    var data: CustomData? {
//        didSet {
//            guard let data = data else { return }
//            bg.image = data.backgroundImage
//
//        }
//    }
    
    var bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 40
        iv.backgroundColor = .clear
        return iv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
     
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
