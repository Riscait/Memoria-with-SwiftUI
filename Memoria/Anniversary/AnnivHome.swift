import SwiftUI

/// 記念日をカテゴリ毎に表示するホーム画面
struct AnnivHome : View {
    /// お気に入りの記念日を抽出
    var featuredAnnivs: [Anniv] {
        annivs.filter {$0.isFeatured}
    }
    /// 表示すべきブロックを定義
    var sections: [String: [Anniv]] {
        // 記念日のカテゴリでグルーピング
        var categories = Dictionary.init(grouping: annivs) { $0.category.name }
        // 繰り返さない、終了済みの記念日をカテゴリに追加
        categories["Passed"] = annivs.filter { $0.theDay < Date() && !$0.isAnnualy }
        return categories
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // お気に入りが一つもない場合はFeaturedブロックを表示しない
                if !featuredAnnivs.isEmpty {
                    FeaturedAnnivs(annivs: featuredAnnivs)
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                }
                // カテゴリーでグルーピングしたセクションの数だけブロックを作成
                ForEach(sections.keys.sorted().identified(by: \.self)) { key in
                    CategoryRow(categoryName: key, annivs: self.sections[key]!)
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
                PresentationLink(destination: Text("Editer")) {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                        .accessibility(label: Text("Add Anniversary"))
            })
        }
    }
}

struct FeaturedAnnivs: View {
    var annivs: [Anniv]
    var body: some View {
        AnnivUtil.configureImage(imageData: annivs[0].iconImage, annivCategory: annivs[0].category)
    }
}

#if DEBUG
struct AnnivHome_Previews : PreviewProvider {
    static var previews: some View {
        AnnivHome()
    }
}
#endif
