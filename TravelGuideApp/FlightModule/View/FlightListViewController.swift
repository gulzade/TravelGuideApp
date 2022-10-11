//
//  FlightListViewController.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 10.10.2022.
//

import UIKit
import Kingfisher

class FlightListViewController: UIViewController {
    
    @IBOutlet weak var flightsTableView: UITableView!
    private let flightsCellIdentifier = "FlightListTableViewCell"
    private let viewModel = FlightListViewModel() //viewModel instance
    private var flightList: [FlightCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
    }

}


private extension FlightListViewController {
    func setupUI(){  // View'ı daha sadeleştirmek, basite indirgemek için fonk. içine taşıdık
        navigationItem.title = "Flights"
       
       navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButtonIcon")
       navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButtonIcon")
       navigationController?.navigationBar.topItem?.backButtonTitle = ""
       self.navigationController!.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "SourceSansPro-Bold", size: 30)!
                
        
        ]
        flightsTableView.delegate = self
        flightsTableView.dataSource = self
        flightsTableView.separatorColor = UIColor.white//table bucreler arası cızgının renkını arka planla aynı yaptık
        registerCell()
    }
    
    func registerCell() {
        flightsTableView.register(.init(nibName: "FlightListTableViewCell", bundle: nil), forCellReuseIdentifier: flightsCellIdentifier)
    }
}

extension FlightListViewController: FlightListViewModelProtocol {
    func didCellItemFetch(_ items: [FlightCellViewModel]) {
        self.flightList = items
        DispatchQueue.main.async {
            self.flightsTableView.reloadData()
            
        }
    }
    
}

extension FlightListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
        flightsTableView.deselectRow(at: indexPath, animated: true)
        let flight = flightList[indexPath.row]
        let detailsController = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailsController.flight = flight
        navigationController?.pushViewController(detailsController, animated: true)
    }
 
}
extension FlightListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = flightsTableView.dequeueReusableCell(withIdentifier: flightsCellIdentifier) as! FlightListTableViewCell
        
        cell.flightImageView.kf.setImage(with: URL(string: "https://images.hdqwalls.com/wallpapers/lofoten-norway-village-aurora-northern-lights-4k-pb.jpg"))
      
        cell.flightNameLabel.text = flightList[indexPath.row].airportName!
        cell.flightIata.text = "\(flightList[indexPath.row].departureIata!) - \(flightList[indexPath.row].arrivalIata!)"
        cell.setupUICell()
   
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        
        return 175
        
    }
}
