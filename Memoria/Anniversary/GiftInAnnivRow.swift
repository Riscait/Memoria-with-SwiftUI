import SwiftUI

/// 記念日詳細画面で表示するギフトの行
struct GiftInAnnivRow : View {
    let gift: Gift
    
    var icon: Image {
        if let icon = gift.iconImage, let uiImage = UIImage(data: icon) {
            return Image(uiImage: uiImage)
        }
        return Image("GiftSample")
    }
    
    var directionImage: Image {
        if gift.isReceived {
            return Image(systemName: "tray.and.arrow.down.fill")
        }
        return Image(systemName: "tray.and.arrow.up.fill")
    }
    var body: some View {
        HStack {
            icon
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(gift.goodsName)
                .font(.headline)
            Spacer()
            if gift.isReceived {
                Image(systemName: "tray.and.arrow.down.fill")
                    .foregroundColor(.purple)
            } else {
                Image(systemName: "tray.and.arrow.up.fill")
                    .foregroundColor(.orange)
            }
        }
    }
}

#if DEBUG
struct GiftInAnnivRow_Previews : PreviewProvider {
    static var previews: some View {
        GiftInAnnivRow(gift: gift1)
    }
}
#endif
