import SwiftUI

/// 記念日を選択して遷移する記念日の詳細画面
struct AnnivDetail : View {
    @State var showingEditor = false

    let anniversary: Anniversary
    
    var body: some View {
        
        let image = Image("AnnivSample1")
        
        return VStack {
            AnnivDetailCover(anniversary: anniversary)
            List {
                // 誕生日の場合は、星座と干支を表示する
                if anniversary is Birthday {
                    Section(header: Text("Anniversary Infomation")) {
                        HStack {
                            Text("Zodiac Star sign")
                                .font(.subheadline)
                            Spacer()
                            Text(ZodiacSign.Star.getStarSign(date: anniversary.theDay).rawValue)
                        }
                        HStack {
                            Text("Chinese Zodiac")
                                .font(.subheadline)
                            Spacer()
                            Text(ZodiacSign.Chinese.getChineseZodiacSign(
                                date: anniversary.theDay)?.rawValue ?? "unknown"
                            )
                        }
                    }
                }
                if !anniversary.memo.isEmpty {
                    Section(header: Text("Note"))  {
                        Text(anniversary.memo)
                            .lineLimit(nil)
                    }
                }
                Section(header: Text("Gifts")) {
                    ForEach(gifts, id: \.id) { row in
                        GiftInAnnivRow(gift: row)
                    }
                }
                }
            .listStyle(.grouped)
            }
            .navigationBarTitle(Text("Anniversary Detail"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {self.showingEditor.toggle()} ) {
                    Image(systemName: "slider.horizontal.3")
                        .imageScale(.large)
                        .accessibility(label: Text("Edit"))
                }
            )
            .sheet(isPresented: $showingEditor) {
                Text("Edit")
            }
    }
}

#if DEBUG
struct AnnivDetail_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AnnivDetail(anniversary: normalAnnivData)
            }
            NavigationView {
                AnnivDetail(anniversary: manualBirthdayData)
            }
        }
    }
}
#endif
