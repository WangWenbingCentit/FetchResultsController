//
//  Mammal+CoreDataProperties.swift
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

import Foundation
import CoreData


extension Mammal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mammal> {
        return NSFetchRequest<Mammal>(entityName: "Mammal");
    }

    @NSManaged public var habit: String?
    @NSManaged public var suckle: String?
    @NSManaged public var walk: String?

}
