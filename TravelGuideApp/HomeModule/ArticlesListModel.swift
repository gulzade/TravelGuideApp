//
//  ArticlesModel.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 9.10.2022.
//

import Foundation

protocol ArticlesListModelProtocol: AnyObject{
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class ArticlesListModel{
    weak var delegate: ArticlesListModelProtocol?   //Protocol delegate
    
    var articles:[Articles] = []
    
    func fetchData(){ // Datalar çekeliyor
        
        guard let path = Bundle.main.path(forResource: "TopPickArticles", ofType: "json") else {
          
                   print("\n-------> bundle path error")
                   return
               }
               let url = URL(fileURLWithPath: path)
               
               do {
                   let jsonData = try Data(contentsOf: url)
                   self.articles = try JSONDecoder().decode([Articles].self, from: jsonData)
                   self.delegate?.didDataFetchProcessFinish(true)
                   print("\n-------> response: \(self.articles)")
               }
               catch {
                   self.delegate?.didDataFetchProcessFinish(false)
                   print("\n====> error: \(error)" )
               }
               return
           }
  
}
