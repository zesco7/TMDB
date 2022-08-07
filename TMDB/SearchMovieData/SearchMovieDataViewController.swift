//
//  SearchMovieDataViewController.swift
//  TMDB
//
//  Created by Mac Pro 15 on 2022/08/06.
//

import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class SearchMovieDataViewController: UIViewController {
    
    @IBOutlet weak var result: UICollectionView!
    
    var list : [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.delegate = self
        result.dataSource = self
        result.register(UINib(nibName: SearchMovieDataCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SearchMovieDataCollectionViewCell.identifier)
        
        dataRequest()
        
    }
    
    func dataRequest() {
        
        let apiKey = APIKey.TMDB
        let url = EndPoint.searchMovieDataURL + "movie/day?api_key=\(apiKey)"
        
        AF.request(url, method: .get).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for i in 0...19 {
                    
                    let openingDay = json["results"][i]["release_date"].stringValue
                    print(openingDay)
                    
                    //let genre = json["results"][i]["genre_ids"].stringValue
                    //print(genre)
                    
                    let previewImageUrl = "https://image.tmdb.org/t/p/w500/" + json["results"][i]["poster_path"].stringValue
                    print(previewImageUrl)
                    
                    let movieTitle  = json["results"][i]["title"].stringValue
                    print(movieTitle)
                    
                    //let cast  = json["results"][0][""].stringValue
                    //print(cast)
                    
                    let data = MovieModel(releasedDate: openingDay, previewImage: previewImageUrl, title: movieTitle)
                    
                    self.list.append(data)
                }
                self.result.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension SearchMovieDataViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchMovieDataCollectionViewCell.identifier, for: indexPath) as? SearchMovieDataCollectionViewCell else { return UICollectionViewCell() }
        
        let data = list[indexPath.row]
        print(data)
        
        cell.releasedDate.text = data.releasedDate
        cell.title.text = data.title
        //self.genre.text = genre
        cell.divisionLIne.layer.borderWidth = 1
        cell.divisionLIne.tintColor = .darkGray
        cell.goToDetailPageButton.setTitle("자세히 보기", for: .normal)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 20
        let width: CGFloat = (collectionView.bounds.width - margin)
        let height: CGFloat = width
        
        return CGSize(width: width, height: height)
    }
}
