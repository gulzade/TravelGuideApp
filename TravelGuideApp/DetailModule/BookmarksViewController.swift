//
//  BookmarksViewController.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import UIKit

class BookmarksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Bookmarks"
       
       navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButtonIcon")
       navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButtonIcon")
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationController!.navigationBar.titleTextAttributes = [
             .foregroundColor: UIColor.black,
             .font: UIFont(name: "SourceSansPro-Bold", size: 30)!      ]
    }
    

    
  
}
