//
//  Score+CoreDataProperties.swift
//  MyPuzzleIOS
//
//  Created by xiaonan li on 15/5/16.
//  Copyright © 2016年 xiaonan li. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Score {

    @NSManaged var name: String?
    @NSManaged var time: NSDate?
    @NSManaged var times: String?

}
