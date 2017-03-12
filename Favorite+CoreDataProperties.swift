//
//  Favorite+CoreDataProperties.swift
//  FavoritePlaces
//
//  Created by Jeff Li on 1/29/17.
//  Copyright © 2017 Jeff Li. All rights reserved.
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite");
    }

    @NSManaged public var name: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var latitudeDelta: Double
    @NSManaged public var longitudeDelta: Double

}
