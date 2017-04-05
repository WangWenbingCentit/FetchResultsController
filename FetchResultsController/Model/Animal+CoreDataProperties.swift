//
//  Animal+CoreDataProperties.swift
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

import Foundation
import CoreData


extension Animal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animal> {
        return NSFetchRequest<Animal>(entityName: "Animal");
    }

    @NSManaged public var eatFood: String?
    @NSManaged public var sleepDec: String?

}
