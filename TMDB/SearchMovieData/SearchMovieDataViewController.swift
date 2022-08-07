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
        result.register(UINib(nibName: SearchMovieDataCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SearchMovieDataCollectionViewCell.identifier)
    
    }

}

extension SearchMovieDataViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchMovieDataCollectionViewCell.identifier, for: indexPath) as? SearchMovieDataCollectionViewCell else { return UICollectionViewCell() }
        
        cell.dataRequest()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 20
        let width: CGFloat = (collectionView.bounds.width - margin)
        let height: CGFloat = width
        
        return CGSize(width: width, height: height)
    }
}
