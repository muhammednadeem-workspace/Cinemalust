//
//  PopularCollectionViewCell.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 02/09/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    private func setStyle(){
        imageView.layer.cornerRadius = 10
    }
    
    func setImage(name: String){
        let image = UIImage(named: name)
        imageView.image = image
    }

}
