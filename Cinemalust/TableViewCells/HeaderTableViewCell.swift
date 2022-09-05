//
//  HeaderTableViewCell.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 31/08/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var featuredLbl: UILabel!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    var isSearchedClicked: Bool = false
    var onClickSearch: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setStyle(){
        buttonView.layer.cornerRadius = 20
        
        //buttonAction
        searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
    }
    
    @objc func searchPressed(){
        isSearchedClicked = !isSearchedClicked
        self.onClickSearch?(isSearchedClicked)
    }
}
