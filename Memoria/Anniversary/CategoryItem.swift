import SwiftUI

struct CategoryItem: View {
    var anniversary: Anniversary
    
    var title: String {
        switch anniversary {
        case let anniversary as Anniv:
            return anniversary.title
            
        case let birthday as Birthday:
            return NameManager.getFullName(isFamilyNameFirst: true,
                                           familyName: birthday.familyName,
                                           givenName: birthday.givenName)
        default: fatalError()
        }
    }
    
    var anniversaryCategory: AnniversaryCategory {
        anniversary is Anniv ? .anniv : .birthday
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            AnnivUtil.configureImage(imageData: anniversary.iconImage, annivCategory: anniversaryCategory)
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
            Text(title)
                .foregroundColor(.primary)
                .font(.caption)
            Text(anniversary.theDay.getMonthDayString)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#if DEBUG
struct CategoryItem_Previews : PreviewProvider {
    static var previews: some View {
        CategoryItem(anniversary: manualBirthdayData)
    }
}
#endif
