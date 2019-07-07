import SwiftUI

/// ホーム画面で表示する各カテゴリーのブロック
struct CategoryRow : View {
    
    var categoryName: String
    var annivs: [Anniv]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(annivs.identified(by: \.id)) { anniv in
                    NavigationLink(
                            destination: AnnivDetail(anniv: anniv)) {
                                CategoryItem(anniv: anniv)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var anniv: Anniv
    var body: some View {
        VStack(alignment: .leading) {
            Text("sss")
            Text("sss")
        }
        .padding(.leading, 15)
    }
}
#if DEBUG
struct CategoryRow_Previews : PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: "Birthday", annivs: annivs)
    }
}
#endif
