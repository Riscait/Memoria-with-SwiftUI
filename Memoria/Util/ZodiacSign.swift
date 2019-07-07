//
//  ZodiacSign.swift
//
//  Created by 村松龍之介 on 2018/11/26.
//  Copyright © 2018 村松龍之介. All rights reserved.
//

import Foundation

struct ZodiacSign {
    /// 12星座
    enum Star: String {
        case aries
        case taurus
        case gemini
        case cancer
        case leo
        case virgo
        case libra
        case scorpio
        case sagittarius
        case capricorn
        case aquarius
        case pisces
        
        /// 日付から星座を調べて文字列を返す
        ///
        /// - Parameter date: 星座を調べたい日付
        /// - Returns: 星座名
        static func getStarSign(date: Date) -> Self {
            // 日付の「月」と「日」を取得
            let monthAndDayDate = Calendar.current.dateComponents([.month, .day], from: date)
            
            switch (monthAndDayDate.month!, monthAndDayDate.day!) {
            case (3, 21...31), (4, 1...19):
                return ZodiacSign.Star.aries
            case (4, 20...31), (5, 1...20):
                return ZodiacSign.Star.taurus
            case (5, 21...31), (6, 1...21):
                return ZodiacSign.Star.gemini
            case (6, 22...31), (7, 1...22):
                return ZodiacSign.Star.cancer
            case (7, 23...31), (8, 1...22):
                return ZodiacSign.Star.leo
            case (8, 23...31), (9, 1...22):
                return ZodiacSign.Star.virgo
            case (9, 23...31), (10, 1...23):
                return ZodiacSign.Star.libra
            case (10, 24...31), (11, 1...22):
                return ZodiacSign.Star.scorpio
            case (11, 23...31), (12, 1...21):
                return ZodiacSign.Star.sagittarius
            case (12, 22...31), (1, 1...19):
                return ZodiacSign.Star.capricorn
            case (1, 20...31), (2, 1...18):
                return ZodiacSign.Star.aquarius
            case (2, 19...31), (3, 1...20):
                return ZodiacSign.Star.pisces
            default:
                fatalError("想定外の日付が入力されました")
            }
        }
    }
    
    /// 十二支（干支）
    enum Chinese: String {
        case rat
        case ox
        case tiger
        case rabbit
        case dragon
        case snake
        case horse
        case sheep
        case monkey
        case rooster
        case dog
        case pig
        
        /// 日付から干支を調べて文字列を返す
        ///
        /// - Parameter date: 干支を調べたい日付
        /// - Returns: 十二支名
        static func getChineseZodiacSign(date: Date) -> Self? {
            // 日付の「年」を取得。1年なら「不明」
            guard let year = Calendar.current.dateComponents([.year], from: date).year,
                year != 1 else {
                    return nil
            }
            
            switch year % 12 {
            case 4:
                return ZodiacSign.Chinese.rat
            case 5:
                return ZodiacSign.Chinese.ox
            case 6:
                return ZodiacSign.Chinese.tiger
            case 7:
                return ZodiacSign.Chinese.rabbit
            case 8:
                return ZodiacSign.Chinese.dragon
            case 9:
                return ZodiacSign.Chinese.snake
            case 10:
                return ZodiacSign.Chinese.horse
            case 11:
                return ZodiacSign.Chinese.sheep
            case 0:
                return ZodiacSign.Chinese.monkey
            case 1:
                return ZodiacSign.Chinese.rooster
            case 2:
                return ZodiacSign.Chinese.dog
            case 3:
                return ZodiacSign.Chinese.pig
            default:
                fatalError("あり得ない年です")
            }
        }
    }
}
