//
//  Anniv.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/06/29.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation

struct Anniv {
    
    enum Category {
        case anniv(title: String)
        case birthday(
            isFromContact: Bool,
            familyName: String?,
            givenName: String?
        )
        
        var name: String {
            switch self {
            case .anniv: return "Anniversary"
            case .birthday: return "Birthday"
            }
        }
    }
    
    let category     : Category
    let id           : String
    let theDay       : Date // TODO: Timestamp
    let isAnnualy    : Bool
    let isFeatured   : Bool
    let memo         : String
    let iconImage    : Data?
    let createdDate  : Date
    let updatedDate  : Date
    let isHidden     : Bool
}
