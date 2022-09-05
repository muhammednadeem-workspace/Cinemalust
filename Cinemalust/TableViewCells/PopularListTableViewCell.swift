//
//  PopularListTableViewCell.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 02/09/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import UIKit

class PopularListTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headingLbl: UILabel!

    public var filmListArray = [String]()
    var onClick: ((Int)->(Void))?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
        registerNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setStyle(){
        collectionView.backgroundColor = .black
    }
    
    private func registerNib(){
        collectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension PopularListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
        let image = filmListArray[indexPath.row]
        cell.setImage(name: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onClick?(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 200)
    }
}
