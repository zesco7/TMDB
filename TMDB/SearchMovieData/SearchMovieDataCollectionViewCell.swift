//
//  SearchMovieDataCollectionViewCell.swift
//  TMDB
//
//  Created by Mac Pro 15 on 2022/08/07.
//

import UIKit

import Alamofire
import SwiftyJSON

class SearchMovieDataCollectionViewCell: UICollectionViewCell {

    static let identifier = "SearchMovieDataCollectionViewCell"
    
    @IBOutlet weak var releasedDate: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cast: UILabel!
    @IBOutlet weak var divisionLIne: UIView!
    @IBOutlet weak var goToDetailPageButton: UIButton!
    
    func dataRequest() {
            
        let apiKey = APIKey.TMDB
        let url = EndPoint.searchMovieDataURL + "movie/day?api_key=\(apiKey)"
        
        AF.request(url, method: .get).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let releasedDate = json["results"][0]["release_date"].stringValue
                print(releasedDate)
                
                let genre = json["results"][0]["genre_ids"].stringValue
                print(genre)
                
                let previewImage = json["results"][0]["genre_ids"].stringValue
                
                let title  = json["results"][0]["title"].stringValue
                print(title)
                
                let cast  = json["results"][0]["title"].stringValue
                print(title)
                
                self.releasedDate.text = releasedDate
                self.genre.text = genre
                
            case .failure(let error):
                print(error)
            }
        }
    }
            
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
