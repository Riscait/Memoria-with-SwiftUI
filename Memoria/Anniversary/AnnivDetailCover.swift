import SwiftUI

/// 記念日詳細画面のトップであるカバーブロック
struct AnnivDetailCover : View {
    let anniv: Anniv
    
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
    
    var iconImage: Image {
        AnnivUtil.configureImage(imageData: anniv.iconImage, annivCategory: anniv.category)
    }
    
    var body: some View {
        VStack {
            // カバー画像
            iconImage
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .blur(radius: 3, opaque: false)
            iconImage
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -150)
                .padding(.bottom, -140)
            HStack {
                Text(title).font(.title)
                Button(action: {
                    print("")
                }) {
                    if Bool.random() {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct AnnivDetailCover_Previews : PreviewProvider {
    static var previews: some View {
        AnnivDetailCover(anniv: normalAnniv)
    }
}
#endif
