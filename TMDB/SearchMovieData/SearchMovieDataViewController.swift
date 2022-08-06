//
//  SearchMovieDataViewController.swift
//  TMDB
//
//  Created by Mac Pro 15 on 2022/08/06.
//

import UIKit


class SearchMovieDataViewController: UIViewController {

    @IBOutlet weak var result: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        result.delegate = self
        result.dataSource = self
    }

}

extension SearchMovieDataViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchMovieDataCollectionViewCell.identifier, for: indexPath) as? SearchMovieDataCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}
