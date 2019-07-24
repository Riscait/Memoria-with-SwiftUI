//
//  Anniv.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/06/29.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation

struct Anniv: Anniversary {
        
    let id           : String
    let category     = AnniversaryCategory.anniv
    let title        : String
    let theDay       : Date // TODO: Timestamp
    let isAnnualy    : Bool
    let isFavorite   : Bool
    let memo         : String
    let iconImage    : Data?
    var createdDate  : Date = Date()
    var updatedDate  : Date? = nil
    var isHidden     : Bool = false
    
    /// FirestoreがSwiftのカスタムオブジェクトに非対応なので、登録前に辞書型に変換する必要がある
    var toDictionary: [String: Any] {
        
        var dictionary = [String: Any]()
        dictionary["id"] = id
        dictionary["category"] = category.rawValue
        dictionary["title"] = title
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

extension Anniv {
    // Firestoreのデータは辞書型なので、手動で「Anniv」に変換する
    init?(dictionary: [String: Any]) {
        self.id = dictionary["id"] as! String
        self.title = dictionary["title"] as! String
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

