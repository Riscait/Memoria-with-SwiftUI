//
//  Birthday.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/07/24.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation

struct Birthday: Anniversary {
        
    let id            : String
    var category      = AnniversaryCategory.birthday
    let givenName     : String
    let familyName    : String
    let isFromContact : Bool
    let theDay        : Date // TODO: Timestamp
    let isAnnualy     : Bool
    let isFavorite    : Bool
    let memo          : String
    let iconImage     : Data?
    let createdDate   : Date
    let updatedDate   : Date?
    let isHidden      : Bool
    
    /// FirestoreがSwiftのカスタムオブジェクトに非対応なので辞書型に変換する必要がある
    var toDictionary: [String: Any] {
        
        var dictionary = [String: Any]()
        dictionary["id"] = id
        dictionary["category"] = category.rawValue
        dictionary["givenName"] = givenName
        dictionary["familyName"] = familyName
        dictionary["isFromContact"] = isFromContact
        dictionary["theDay"] = theDay
        dictionary["isAnnualy"] = isAnnualy
        dictionary["isFavorite"] = isFavorite
        dictionary["memo"] = memo
        dictionary["iconImage"] = iconImage
        dictionary["createdDate"] = createdDate
        dictionary["updatedDate"] = updatedDate
        dictionary["isHidden"] = isHidden

        return dictionary
    }
}

extension Birthday {
    // Firestoreのデータは辞書型なので、手動で変換する
    init?(dictionary: [String: Any]) {
        self.id = dictionary["id"] as! String
        self.givenName = dictionary["givenName"] as! String
        self.familyName = dictionary["familyName"] as! String
        self.isFromContact = dictionary["isFromContact"] as! Bool
        self.theDay = dictionary["theDay"] as! Date
        self.isAnnualy = dictionary["isAnnualy"] as! Bool
        self.isFavorite = dictionary["isFavorite"] as! Bool
        self.memo = dictionary["memo"] as! String
        self.iconImage = dictionary["iconImage"] as? Data
        self.createdDate = dictionary["createdDate"] as! Date
        self.updatedDate = dictionary["updatedDate"] as? Date
        self.isHidden = dictionary["isHidden"] as! Bool
    }
}
