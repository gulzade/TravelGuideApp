//
//  DetailViewController.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 10.10.2022.
//

import UIKit
import Kingfisher

protocol AddTodoItemProtocol {
    func didAddedTodoItem(_ isAdded: Bool)
}
class DetailViewController: UIViewController, AddNewItemViewModelProtocol {
    
        func didItemAdd(_ isSuccess: Bool) {
            if isSuccess {
                // anasayfadaki listeyi güncellemek için
                delegate?.didAddedTodoItem(true)
                
                dismiss(animated: true)
            }
        
    }
    
    
    
    
    @IBOutlet weak var detailImageBackgroundView: UIView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailCategoriesLabel: UILabel!
    @IBOutlet weak var detailscrollView: UIScrollView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    
    var delegate: AddTodoItemProtocol?
    private let viewModel = AddNewItemViewModel()
    var hotel: HotelCellViewModel?
    var flight : FlightCellViewModel?
    var article: Articles?
    private var checkButton: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDelegate = self
       
        if flight != nil {
            if let flight = flight {
                detailCategoriesLabel.text = flight.category!
                detailTitle.text = flight.airportName!
                detailDescriptionLabel.text = "Departure ıata:  \(flight.departureIata!) \nArrival ıata:  \(flight.arrivalIata!)  \nTime:  \(flight.flightDate!) \nFlight number:  \(flight.flightNumber!)"
            }
        }
        else if article != nil {
            if let article = article {
                detailImageView.kf.setImage(with: URL(string: article.articlesImageUrl!))
                detailCategoriesLabel.text = "Article"
                detailTitle.text = article.articlesTitle!
                detailDescriptionLabel.text = article.articlesDescription!
            }
        }
        else if hotel != nil {
            if let hotel = hotel {
                detailImageView.kf.setImage(with: URL(string: (hotel.hotelImageURL!)))
            detailCategoriesLabel.text = hotel.category!
            detailTitle.text = hotel.hotelName!
            detailDescriptionLabel.text = hotel.hotelDescription
        }
        }
        setupUI()
    }
    
    private func setupUI(){
        
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        detailImageBackgroundView.layer.cornerRadius = 40
        detailImageBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        detailImageView.layer.cornerRadius = 40
        detailImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    @IBAction func addBookmarksButton(_ sender: UIButton) {
        
        guard let itemTitle = detailTitle.text else { return }
        guard let itemDetails = detailDescriptionLabel.text else { return }
        
        viewModel.didSaveButtonPressed(name: itemTitle, details: itemDetails)
    }
  

}
