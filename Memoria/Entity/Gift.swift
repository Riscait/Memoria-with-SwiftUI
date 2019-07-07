//
//  Gift.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/06/29.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation

struct Gift {
    let id             : String
    let goodsName      : String
    let isReceived     : Bool
    let otherPersonName: String
    let annivName      : String
    let giftDate       : Date // TODO: Timestamp
    let memo           : String
    let iconImage      : Data?
    let createdDate    : Date
    let updatedDate    : Date
    let isHidden       : Bool
}
