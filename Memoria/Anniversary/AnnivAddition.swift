import SwiftUI

struct AnnivAddition: View {
    /// 記念日追加画面を表示中かどうか
    @State private var showingWaySelection = true
    @State private var titleField = ""
    @State private var memoField = ""
    @State private var enableAnnual = true
    @State private var selectedDate = Date()

    let repository: AnnivRepository
    
    var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMMd", options: 0, locale: Locale.current)
        return df
    }()
    
    var body: some View {
        
        Form {
            Section(header: Text("Anniversary name")) {
                TextField("Salad anniversary", text: $titleField, onEditingChanged: { (isChange) in
                    // テキスト変更時
                }) {
                    // コミット時
                }
            }
            Section {
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                
                Toggle("Annual", isOn: $enableAnnual)
            }
            Section(header: Text("Memo")) {
                TextField("e.g. Rei", text: $memoField, onEditingChanged: { (isEditing) in
                    // テキスト変更時
                }) {
                    // コミット時
                }
            }
            Section {
                Button(action: {
                    let uuid = UUID().uuidString
                    let anniv = Anniv(id: uuid,
                                      title: self.titleField,
                                      theDay: self.selectedDate,
                                      isAnnualy: self.enableAnnual,
                                      isFavorite: false,
                                      memo: self.memoField,
                                      iconImage: nil)
                    // 登録
                    self.repository.create(documentPath: uuid, anniversary: anniv, isMerge: true)
                    
                }) {
                    Text("Add")
                }
            }
        }
        .listStyle(.grouped)
            .actionSheet(isPresented: $showingWaySelection) {
            ActionSheet(title: Text("Please select an anniversary to add"),
                        message: nil,
                        buttons: [
                            .default(Text("Add a Anniversary")) { /* 記念日を選択した時の動作 */ },
                            .default(Text("Add a Birthday")) { /* 誕生日を選択した時の動作 */ },
                            .default(Text("Import Birthdays from contcts")) { /* インポートを選択した時の動作 */ },
                            .cancel()
                ]
            )
        }
    }
}

#if DEBUG
struct AnnivAddition_Previews: PreviewProvider {
    static var previews: some View {
        AnnivAddition(repository: AnnivDataStore())
        .listStyle(.grouped)
    }
}
#endif
