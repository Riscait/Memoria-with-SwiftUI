import Foundation

extension Date {
    /// 日付を月日のフォーマットにして文字列で返す
    ///
    /// - Parameter date: 日時データ
    /// - Returns: 「M月d日」フォーマットの文字列
    var getMonthDayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MMMd", options: 0, locale: Locale.current)
        return dateFormatter.string(from: self)
    }
    
    /// 日付を各国の年月日のフォーマットにして文字列で返す。年がない場合は月日を返す
    ///
    /// - Parameter date: 日時データ
    /// - Returns: 年月日の順番は国によって違う
    var getYMDString: String {
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        // 「年」情報を持っているか否か（1年は年情報がない、ということになる）
        let hasYear = calendar.dateComponents([.year], from: self).year! != 1 ? true : false
        if hasYear {
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMMd", options: 0, locale: Locale.current)
            return dateFormatter.string(from: self)
        } else {
            // 「年」情報がなければ月と日だけのフォーマットを返す
            return self.getMonthDayString
        }
    }

}
