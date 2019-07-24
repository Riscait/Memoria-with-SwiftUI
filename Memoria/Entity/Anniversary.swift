//
//  Anniversary.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/07/24.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation

protocol Anniversary {
    
    var id           : String { get }
    var category     : AnniversaryCategory { get }
    var theDay       : Date { get } // TODO: Timestamp
    var isAnnualy    : Bool { get }
    var isFavorite   : Bool { get }
    var memo         : String { get }
    var iconImage    : Data? { get }
    var createdDate  : Date { get }
    var updatedDate  : Date? { get }
    var isHidden     : Bool { get }
    var toDictionary : [String: Any] { get }
}

enum AnniversaryCategory: String, CustomStringConvertible {
    
    case anniv
    case birthday
        
    var description: String {
        switch self {
        case .anniv: return "Anniversary"
        case .birthday: return "Birthday"
        }
    }
}
