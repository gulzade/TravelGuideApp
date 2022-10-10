//
//  ArticlesViewModel.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 9.10.2022.
//

import Foundation

protocol ArticleslistViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [Articles]) //view'a haber vermek için

}


class ArticlesViewModel {
    
    private let modelArticles = ArticlesListModel()
    
    weak var viewDelegate: ArticleslistViewModelViewProtocol? // delegate işlemleri çekmek için
    
    init() {
        modelArticles.delegate = self // modeldan haber almaya başlamak için
    }
    

    func didViewLoad(){
        modelArticles.fetchData() //  viewcontroller didload oldugunda yani ekranda gözüktüğünde viewModela haber verecek, viewModelda gitcek dataları çekecek
        
    }
    func didClickItem(at index: Int){ // basılan index
        let selectedItem = modelArticles.articles[index]
    }

}

private extension ArticlesViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ articles: [Articles]) -> [Articles] { //gelen dataya göre viewbase model yapacak
        return articles.map{(.init(articlesTitle: $0.articlesTitle!, articlesDescription: $0.articlesDescription!, articlesId: $0.articlesId!, articlesImageUrl: $0.articlesImageUrl!))}
    }
}

    // MARK: - PhotoListModelProtocol
extension ArticlesViewModel: ArticlesListModelProtocol{
    
    func didDataFetchProcessFinish(_ isSuccess: Bool) { /*Api'den gelen data burada. ViewModel, Modeldan gelen datayı transform edicek */
        if isSuccess {
            let articles = modelArticles.articles
            let cellModels = makeViewBasedModel(articles)
            viewDelegate?.didCellItemFetch(cellModels)
            
        } else{
           
        }
    }
    
    
    
}
