//
//  SearchViewController.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 5.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
       
        self.searchBar.setSearchFieldBackgroundImage(UIImage(named: "searchBarBackground"), for: UIControl.State.normal)
        searchBar.setImage(UIImage(named: "SerachBarIcon"), for: .search, state: .normal)
        searchBar.backgroundColor =  UIColor.white
        searchBar.clipsToBounds = true
    }

}
/* extension UISearchBar {

    func setupSearchBar(background: UIColor = .white, inputText: UIColor = .black, placeholderText: UIColor = .gray, image: UIColor = .black) {

        self.searchBarStyle = .minimal

        self.barStyle = .default

        // IOS 12 and lower:
        for view in self.subviews {

            for subview in view.subviews {
                if subview is UITextField {
                    if let textField: UITextField = subview as? UITextField {

                        // Background Color
                        textField.backgroundColor = UIColor.white

                        //   Text Color
                        textField.textColor = inputText

                        //  Placeholder Color
                        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderText])

                        //  Default Image Color
                        if let leftView = textField.leftView as? UIImageView {
                            leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                            leftView.tintColor = image
                        }

                        let backgroundView = textField.subviews.first
                        backgroundView?.backgroundColor = UIColor.white
                        backgroundView?.layer.cornerRadius = 10.5
                        backgroundView?.layer.masksToBounds = true

                    }
                }
            }

        }

    }

} */
