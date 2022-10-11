//
//  HotelListViewController.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import UIKit

class HotelListViewController: UIViewController {

    @IBOutlet weak var hotelsTableView: UITableView!
    private let hotelsCellIdentifier = "HotelsListTableViewCell"
    private let viewModelHotel = HotelListViewModel() //viewModel instance
    private var hotelList: [HotelCellViewModel] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        viewModelHotel.viewDelegate = self
        viewModelHotel.didViewLoad()
    }
    
}
private extension HotelListViewController {
    func setupUI(){  // View'ı daha sadeleştirmek, basite indirgemek için fonk. içine taşıdık
        navigationItem.title = "Hotels"
       
       navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButtonIcon")
       navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButtonIcon")
       navigationController?.navigationBar.topItem?.backButtonTitle = ""
       self.navigationController!.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "SourceSansPro-Bold", size: 30)!      ]
        
        hotelsTableView.delegate = self
        hotelsTableView.dataSource = self
        hotelsTableView.separatorColor = UIColor.white//table bucreler arası cızgının renkını arka planla aynı yaptık
        registerCell()
    }
    
    func registerCell() {
        hotelsTableView.register(.init(nibName: "HotelListTableViewCell", bundle: nil), forCellReuseIdentifier: hotelsCellIdentifier)
    }
}
extension HotelListViewController: HotelListViewModelProtocol {
    
    func didCellItemFetch(_ items: [HotelCellViewModel]) {
        self.hotelList = items
        DispatchQueue.main.async {
            self.hotelsTableView.reloadData()
            
        }
    }
    
}
extension HotelListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModelHotel.didClickItem(at: indexPath.row)
        hotelsTableView.deselectRow(at: indexPath, animated: true)
        let hotel = hotelList[indexPath.row]
        let detailsController = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailsController.hotel = hotel
        navigationController?.pushViewController(detailsController, animated: true)
    }
 
}
extension HotelListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hotelsTableView.dequeueReusableCell(withIdentifier: hotelsCellIdentifier) as! HotelListTableViewCell
        print(hotelList[indexPath.row].hotelName!)
        cell.hotelImageView.kf.setImage(with: URL(string: hotelList[indexPath.row].hotelImageURL ?? ""))
        cell.hotelName.text = hotelList[indexPath.row].hotelName!
        cell.hotelCountry.text = hotelList[indexPath.row].hotelCountry!
        cell.setupUIHotelCell()

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        
        return 175
        
    }
}
