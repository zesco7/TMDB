//
//  SearchMovieDataCollectionViewCell.swift
//  TMDB
//
//  Created by Mac Pro 15 on 2022/08/07.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class SearchMovieDataCollectionViewCell: UICollectionViewCell {

    static let identifier = "SearchMovieDataCollectionViewCell"
    
    @IBOutlet weak var releasedDate: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cast: UILabel!
    @IBOutlet weak var divisionLIne: UIView!
    @IBOutlet weak var goToDetailPageButton: UIButton!
    
//    func displayImage() {
//    self.previewImage.kf.setImage(with:URL(string: previewImageUrl)!)
//    }
    
    
            
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
