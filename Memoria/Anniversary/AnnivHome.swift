import SwiftUI

/// 記念日をカテゴリ毎に表示するホーム画面
struct AnnivHome : View {
    /// 記念日追加画面を表示中かどうか
    @State var showingAddAnniv = false

    let anniversarys = sampleAnnivs
    
    /// お気に入りの記念日を抽出
    var featuredAnnivs: [Anniversary] {
        anniversarys.filter {$0.isFavorite}
    }
    /// 表示すべきブロックを定義
    var sections: [String: [Anniversary]] {
        // 記念日のカテゴリでグルーピング
        [
            "Anniversary": anniversarys.filter { $0 is Anniv },
            "Birthday": anniversarys.filter { $0 is Birthday },
            "Passed": anniversarys.filter { $0.theDay < Date() && !$0.isAnnualy }
        ]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // お気に入りが一つもない場合はFeaturedブロックを表示しない
                if !featuredAnnivs.isEmpty {
                    FeaturedAnnivs(anniversarys: featuredAnnivs)
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                }
                // カテゴリーでグルーピングしたセクションの数だけブロックを作成
                ForEach(sections.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, anniversarys: self.sections[key]!)
                }
                .listRowInsets(EdgeInsets())
                // TODO: ここに広告表示したい
                
                // すべての記念日をリスト表示で見るためのボタン
                NavigationLink(destination: AnnivList(listPattern: .all)) {
                    Text("See All")
                }.padding()
            }
            .navigationBarTitle(Text("Anniversarys"), displayMode: .inline)
            // NavigationBarに新規記念日追加ボタンを設置
            .navigationBarItems(trailing:
                Button(action: { self.showingAddAnniv.toggle() }) {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                        .accessibility(label: Text("Add Anniversary"))
                }
            ).sheet(isPresented: $showingAddAnniv, onDismiss: nil) {
                AnnivAddition(repository: AnnivDataStore())
            }
        }
    }
}

struct FeaturedAnnivs: View {
    var anniversarys: [Anniversary]
    
    var anniversaryCategory: AnniversaryCategory {
        anniversarys.first! is Anniv ? .anniv : .birthday
    }
    
    var body: some View {
        AnnivUtil.configureImage(imageData: anniversarys[0].iconImage, annivCategory: anniversaryCategory)
    }
}

#if DEBUG
struct AnnivHome_Previews : PreviewProvider {
    static var previews: some View {
        AnnivHome()
    }
}
#endif
