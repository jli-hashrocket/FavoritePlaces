//
//  ViewController.swift
//  FavoritePlaces
//
//  Created by Jeff Li on 1/29/17.
//  Copyright © 2017 Jeff Li. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var favorites : [Favorite] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        createTestFavoritePlace()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request : NSFetchRequest<NSFetchRequestResult> = Favorite.fetchRequest()
        
        var results : [AnyObject]?
        
        do {
            try! results = context.fetch(request)
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.favorites = results as! [Favorite]
        }
        self.tableView.reloadData()
    }

    func createTestFavoritePlace() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let favorite1 = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context) as! Favorite

        
        favorite1.name = "Lake Tahoe"
        /*favorite1.latitude = 38.830391
        favorite1.longitude = -77.196370
        favorite1.latitudeDelta = 5
        favorite1.longitudeDelta = 5*/
        
        do {
            try! context.save()
        } catch _ {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell") as! mapTableViewCell
        let favorite = self.favorites[indexPath.row]
        cell.favoriteNameLabel.text = favorite.name
        
        /*let coordinate = CLLocationCoordinate2DMake(favorite.latitude, favorite.longitude)
        let span = MKCoordinateSpanMake(favorite.latitudeDelta, favorite.longitudeDelta)
        let region = MKCoordinateRegionMake(coordinate, span)
        cell.favMapView.setRegion(region, animated: false)*/
    
        
        return cell
    }


}

