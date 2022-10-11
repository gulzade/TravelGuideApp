//
//  SearchViewController.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 10.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var PageTitleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBarTextField()
    }
    private func setupUI(){
        
        
        
        
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
    
    
    @IBAction func getHotelButton(_ sender: Any) {
    }
    
    @IBAction func getFlightButton(_ sender: Any) {
    }
}
