import SwiftUI

struct CategoryItem: View {
    var anniv: Anniv
    
    var title: String {
        switch anniv.category {
        case .anniv(let title):
            return title
        case .birthday(_, let familyName, let givenName):
            return NameManager.getFullName(isFamilyNameFirst: true,
                                           familyName: familyName,
                                           givenName: givenName)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
                AnnivUtil.configureImage(imageData: anniv.iconImage, annivCategory: anniv.category)
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
            Text(title)
                .color(.primary)
                    .font(.caption)
                Text(anniv.theDay.getMonthDayString)
                    .color(.primary)
                    .font(.caption)
            }
            .padding(.leading, 15)
        }
}

#if DEBUG
struct CategoryItem_Previews : PreviewProvider {
    static var previews: some View {
        CategoryItem(anniv: manualBirthday)
    }
}
#endif
