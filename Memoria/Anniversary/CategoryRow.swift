import SwiftUI

/// ホーム画面で表示する各カテゴリーのブロック
struct CategoryRow : View {
    
    var categoryName: String
    var annivs: [Anniv]
    
    var listPattern: AnnivList.ListPattern {
        AnnivList.ListPattern(rawValue: categoryName)!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination:
                AnnivList(listPattern: listPattern)
                    .environmentObject(UserData())) {
                        HStack {
                            Text(categoryName)
                                .font(.headline)
                                .padding(.leading, 15)
                                .foregroundColor(.primary)
                            Spacer()
                            Text("See More")
                                .font(.subheadline)
                                .padding(.trailing, 15)
                                .foregroundColor(.secondary)
                        }
            }
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(annivs, id: \.id) { anniv in
                        NavigationLink(destination: AnnivDetail(anniv: anniv)) {
                            CategoryItem(anniv: anniv)
                        }
                    }
                }
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

#if DEBUG
struct CategoryRow_Previews : PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: "Birthday", annivs: annivs)
    }
}
#endif
