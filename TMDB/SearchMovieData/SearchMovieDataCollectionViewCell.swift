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
    
    var list : [MovieModel] = []
    
    func dataRequest() {
            
        let apiKey = APIKey.TMDB
        let url = EndPoint.searchMovieDataURL + "movie/day?api_key=\(apiKey)"
        
        AF.request(url, method: .get).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for i in 0...19 {
                        
                let releasedDate = json["results"][i]["release_date"].stringValue
                print(releasedDate)
                
                //let genre = json["results"][i]["genre_ids"].stringValue
                //print(genre)
                
                let previewImage = json["results"][i]["poster_path"].stringValue
                print(previewImage)
                
                let previewImageUrl = "https://image.tmdb.org/t/p/w500/" + "\(previewImage)"
                print(previewImageUrl)
                
                let title  = json["results"][i]["title"].stringValue
                print(title)
                
                //let cast  = json["results"][0][""].stringValue
                //print(cast)
                    
                let data = MovieModel(releasedDate: releasedDate, previewImage: previewImageUrl, title: title)
                
                self.list.append(data)
                
                self.releasedDate.text = releasedDate
                //self.genre.text = genre
                self.title.text = title
                self.divisionLIne.layer.borderWidth = 1
                self.divisionLIne.tintColor = .darkGray
                self.goToDetailPageButton.setTitle("자세히 보기", for: .normal)
                
                self.previewImage.kf.setImage(with:URL(string: previewImageUrl)!)
                
                }
                
                
                
                
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
