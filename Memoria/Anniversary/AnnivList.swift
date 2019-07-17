import SwiftUI
import Combine

/// 記念日をリスト形式で表示する
struct AnnivList : View {
    @EnvironmentObject var userData: UserData
    
    enum ListPattern: String {
        case anniv = "Anniversary"
        case birthday = "Birthday"
        case passed = "Passed"
        case all = "All Anniversary"
    }
    
    let listPattern: ListPattern
    
    var filterdAnnivs: [Anniv] {
        switch listPattern {
        case .anniv:
            return annivs.filter {
                if case Anniv.Category.anniv = $0.category { return true }
                return false
            }
        case .birthday:
            return annivs.filter {
                if case Anniv.Category.birthday = $0.category { return true }
                return false
            }
        case .passed:
            return annivs.filter { !$0.isAnnualy && $0.theDay < Date() }
            
        case .all:
            return annivs
        }
    }
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Image(systemName: "star")
                Text("Favorites Only")
            }
            ForEach(filterdAnnivs.identified(by: \.id)) { anniv in
                if !self.userData.showFavoritesOnly || anniv.isFeatured {
                    NavigationLink(
                        destination: AnnivDetail(anniv: anniv)
                            .environmentObject(self.userData)
                    ) {
                        AnnivRow(anniv: anniv)
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
