//
//  ViewController.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 1.10.2022.
//

import UIKit
import Kingfisher
class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var flightLabel: UILabel!
    @IBOutlet weak var hotelLabel: UILabel!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var headTittle: UILabel!
    @IBOutlet weak var topArticlesLabel: UILabel!
    @IBOutlet weak var articlesCollectionView: UICollectionView!
    
    private let articlesIdentifier = "ArticleListCollectionViewCell"
    private var viewModelArticle = ArticlesViewModel()
    private var articleItems :[Articles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModelArticle.viewDelegate = self
        viewModelArticle.didViewLoad()
        addShadow()
    }
    
    
    @IBAction func getFlightsButton(_ sender: Any) {
    }
    
    @IBAction func getHotelsButton(_ sender: Any) {
    }
    
}

private extension ArticleListViewController {
    
    func setupUI(){
        articlesCollectionView.delegate = self
        articlesCollectionView.dataSource = self
        
        let design = UICollectionViewFlowLayout()
        design.scrollDirection = .horizontal
        /*  design.sectionInset = UIEdgeInsets(top:7, left: 7, bottom: 7, right: 7)
         design.minimumLineSpacing = 3
         design.minimumInteritemSpacing = 3
         let width = UIScreen.main.bounds.width
         let widthCell = ( width - 26) / 4
         design.itemSize = CGSize(width: widthCell, height: widthCell)*/
        articlesCollectionView.collectionViewLayout = design
        registerCell()
    }
    func registerCell(){
        articlesCollectionView.register(.init(nibName: "ArticleListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: articlesIdentifier)
    }
}

extension ArticleListViewController: ArticleslistViewModelViewProtocol {
    func didCellItemFetch(_ items: [Articles]) { //viewe haber verecek kendi delegesi ile
        self.articleItems = items
        
        DispatchQueue.main.async {
            self.articlesCollectionView.reloadData()
            
        }
    }
    
}

extension ArticleListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModelArticle.didClickItem(at: indexPath.row)
    }
}

extension ArticleListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: articlesIdentifier, for:indexPath) as! ArticleListCollectionViewCell
        if let url = articleItems[indexPath.row].articlesImageUrl{
            cell.articlePhotoImageView.kf.setImage(with: URL(string: url) )
            cell.addShadow()
            cell.setupCellUI()
            
        }
        return cell
    }
    
    
}

extension ArticleListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height:210)
    }
}

extension ArticleListViewController {
    func addShadow(corner: CGFloat = 0.5, color: UIColor = UIColor(red: 0.094, green: 0.196, blue: 0.451, alpha: 0.1), offset: CGSize = CGSize(width: 0, height: 0), opacity: Float = 0.5) {
        
        homeImageView.layer.borderWidth = 0
        homeImageView.layer.borderColor = UIColor.clear.cgColor
        homeImageView.layer.shadowColor = color.cgColor
        homeImageView.layer.shadowOffset = offset
        homeImageView.layer.shadowOpacity = opacity
        homeView.layer.cornerRadius = 0
        homeImageView.layer.masksToBounds = false
        homeImageView.layer.shadowPath = UIBezierPath(roundedRect: homeImageView.bounds, cornerRadius: 0).cgPath
        
        
        
    }
}
