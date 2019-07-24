//
//  SampleData.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/06/30.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation

let normalAnnivData = Anniv(
    id: UUID().uuidString,
    
    title: "afaf",
    theDay: Date()-1000,
    isAnnualy: true,
    isFavorite: true,
    memo: "つれづれなるまゝに、日暮らし、硯にむかひて、心にうつりゆくよしなし事を、そこはかとなく書きつくれば、あやしうこそものぐるほしけれ。（Wikipediaより）",
    iconImage: nil,
    createdDate: Date(),
    updatedDate: Date(),
    isHidden: false
)
let passedAnnivData = Anniv(
    id: UUID().uuidString,
    title: "fghsd h",
    theDay: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365 * 2),
    isAnnualy: false,
    isFavorite: false,
    memo: "つれづれなるまゝに、日暮らし、硯にむかひて、心にうつりゆくよしなし事を、そこはかとなく書きつくれば、あやしうこそものぐるほしけれ。（Wikipediaより）",
    iconImage: nil,
    createdDate: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365 * 2),
    updatedDate: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365 * 2),
    isHidden: false
)
let manualBirthdayData = Birthday(
    id: UUID().uuidString,
    givenName: "g",
    familyName: "f",
    isFromContact: false,
    theDay: Date()-1000,
    isAnnualy: true,
    isFavorite: true,
    memo: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    iconImage: nil,
    createdDate: Date(),
    updatedDate: Date(),
    isHidden: false
)
let importedBirthdayData = Birthday(
    id: UUID().uuidString,
    givenName: "gg",
    familyName: "ff",
    isFromContact: true,
    theDay: Date()-1000,
    isAnnualy: true,
    isFavorite: true,
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

let sampleAnnivs: [Anniversary] = [normalAnnivData, passedAnnivData, manualBirthdayData, importedBirthdayData]
let gifts = [gift1, gift2]
