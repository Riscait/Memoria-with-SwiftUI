import SwiftUI
import Combine

/// 記念日をリスト形式で表示する
struct AnnivList : View {
    @EnvironmentObject private var userData: UserData
    
    enum ListPattern: String {
        case anniv = "Anniversary"
        case birthday = "Birthday"
        case passed = "Passed"
        case all = "All Anniversary"
    }
    
    let listPattern: ListPattern
    
    var filterdAnnivs: [Anniversary] {
        switch listPattern {
        case .anniv:
            return sampleAnnivs.filter { return $0 is Anniv }
            
        case .birthday:
            return sampleAnnivs.filter { return $0 is Birthday }

        case .passed:
            return sampleAnnivs.filter { !$0.isAnnualy && $0.theDay < Date() }
            
        case .all:
            return sampleAnnivs
        }
    }
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Image(systemName: "star")
                Text("Favorites Only")
            }
            ForEach(filterdAnnivs, id: \.id) { anniversary in
                if !self.userData.showFavoritesOnly || anniversary.isFavorite {
                    NavigationLink(
                        destination: AnnivDetail(anniversary: anniversary)
                            .environmentObject(self.userData)
                    ) {
                        AnnivRow(anniversary: anniversary)
                    }
                }
            }
            .navigationBarTitle(listPattern.rawValue)
    }
    }
}

#if DEBUG
struct AnnivList_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnnivList(listPattern: .all)
                .navigationBarTitle("All Anniversary", displayMode: .inline)
                .environmentObject(UserData())
        }
    }
}
#endif
