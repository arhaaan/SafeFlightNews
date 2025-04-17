//
//  ArticleTableViewCell.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

   @IBOutlet weak var sectionLabel: UILabel!
   @IBOutlet weak var collectionView: UICollectionView!
   
   var buttonAction: (() -> Void)?
   
   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      collectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticleCollectionViewCell")
      collectionView.dataSource = self
      collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   @IBAction func seeMoreButtonTapped(_ sender: Any) {
      buttonAction?()
   }
}

extension ArticleTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 5
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as! ArticleCollectionViewCell
      
      cell.imageView.image = UIImage(systemName: "square.and.arrow.up")
      
      return cell
   }
   
}
