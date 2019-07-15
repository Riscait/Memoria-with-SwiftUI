import SwiftUI

struct AnnivUtil {
    /// DataからImageを作成して返却する。Dataがnilの場合は、記念日のカテゴリに適したデフォルトImageを返却する
    /// - Parameter imageData: 画像データ
    /// - Parameter annivCategory: 記念日のカテゴリー
    static func configureImage(imageData: Data?, annivCategory: Anniv.Category) -> Image {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage).resizable()
        }
        switch annivCategory {
        case .anniv:
            return Image("AnnivSample").resizable()
        case .birthday:
            return Image("BirthdayPersonSample").resizable()
        }
    }
    
    static func aaa(imageData: Data?) -> Image {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        }
        return Image("GiftSample")
    }
}

enum RemainingDays {
    case today
    case tomorrow
    case yesterday
    case near
    case distant
    case past
    
    init(_ remainingDays: Int) {
        self = {
            switch remainingDays {
            case 0:
                return .today
            case 1:
                return .tomorrow
            case -1:
                return .yesterday
            case 2...30:
                return .near
            case ...0:
                return .past
            default:
                return .distant
            }
        }()
    }
}
