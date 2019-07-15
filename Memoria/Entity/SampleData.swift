//
//  SampleData.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/06/30.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation

let normalAnniv = Anniv(
    category: .anniv(title: "Marry Day"),
    id: UUID().uuidString,
    theDay: Date()-1000,
    isAnnualy: true,
    isFeatured: true,
    memo: "つれづれなるまゝに、日暮らし、硯にむかひて、心にうつりゆくよしなし事を、そこはかとなく書きつくれば、あやしうこそものぐるほしけれ。（Wikipediaより）",
    iconImage: nil,
    createdDate: Date(),
    updatedDate: Date(),
    isHidden: false
)
let passedAnniv = Anniv(
    category: .anniv(title: "Conference 2018"),
    id: UUID().uuidString,
    theDay: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365 * 2),
    isAnnualy: false,
    isFeatured: false,
    memo: "つれづれなるまゝに、日暮らし、硯にむかひて、心にうつりゆくよしなし事を、そこはかとなく書きつくれば、あやしうこそものぐるほしけれ。（Wikipediaより）",
    iconImage: nil,
    createdDate: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365 * 2),
    updatedDate: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365 * 2),
    isHidden: false
)
let manualBirthday = Anniv(
    category: .birthday(isFromContact: false, familyName: "Arc", givenName: "Hany"),
    id: UUID().uuidString,
    theDay: Date()-1000,
    isAnnualy: true,
    isFeatured: true,
    memo: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    iconImage: nil,
    createdDate: Date(),
    updatedDate: Date(),
    isHidden: false
)
let importedBirthday = Anniv(
    category: .birthday(isFromContact: true, familyName: "Cont", givenName: "Act"),
    id: UUID().uuidString,
    theDay: Date()-1000,
    isAnnualy: true,
    isFeatured: true,
    memo: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    iconImage: nil,
    createdDate: Date(),
    updatedDate: Date(),
    isHidden: false
)

let gift1 = Gift(id: UUID().uuidString,
                goodsName: "Apple Watch Selease 4",
                isReceived: true,
                otherPersonName: "Ryunosuke Muramatsu",
                annivName: "First Date",
                giftDate: Date(),
                memo: "memo\nmemo",
                iconImage: nil, createdDate: Date(),
                updatedDate: Date(),
                isHidden: false
)
let gift2 = Gift(id: UUID().uuidString,
                goodsName: "Magic TrackPad",
                isReceived: false,
                otherPersonName: "Ken Greeny",
                annivName: "Second Date",
                giftDate: Date(),
                memo: "memo\nmemo\nmemo memo memo memo memo memo memo memo memo memo meomo memo memo memo memo meom memo memo memo memo memo memo memo memo memo memo",
                iconImage: nil, createdDate: Date(),
                updatedDate: Date(),
                isHidden: false
)

let annivs = [normalAnniv, passedAnniv, manualBirthday, importedBirthday]
let gifts = [gift1, gift2]
