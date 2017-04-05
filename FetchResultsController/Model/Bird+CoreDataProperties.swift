//
//  Bird+CoreDataProperties.swift
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

import Foundation
import CoreData


extension Bird {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bird> {
        return NSFetchRequest<Bird>(entityName: "Bird");
    }

    @NSManaged public var feed: String?
    @NSManaged public var fly: String?

}
