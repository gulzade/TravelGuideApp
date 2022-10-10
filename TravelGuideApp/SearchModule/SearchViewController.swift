//
//  SearchViewController.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 10.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.navigationItem.title = "Search"
        let appearance = UINavigationBarAppearance()
       
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "SourceSansPro-Bold", size: 30)!]
        self.navigationController?.navigationBar.barStyle = .black //saatin rengi değiştiriliyor şarş göstergesi
        
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
     
        configureSearchBarTextField()
    }
    
    func configureSearchBarTextField() {
        searchBar.layer.borderColor = UIColor(named: "ColorGray")?.cgColor
        searchBar.layer.borderWidth = 1.0
        searchBar.layer.cornerRadius = 0
        searchBar.barTintColor = UIColor.white
        searchBar.layer.backgroundColor =  UIColor.white.cgColor
        searchBar.inputView?.backgroundColor = UIColor.white
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = UIFont(name: "SourceSansPro-Regular", size: 30)
        searchBar.setSearchFieldBackgroundImage(UIImage(named: "searchBarBackground"), for: UIControl.State.normal)
        searchBar.setImage(UIImage(named: "SerachBarIcon"), for: .search, state: .normal)
        searchBar.backgroundColor =  UIColor.white
        searchBar.clipsToBounds = true
    }

   

}
