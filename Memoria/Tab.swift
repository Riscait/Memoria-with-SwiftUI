import SwiftUI

struct Tab : View {
    
    @State private var selection = 0
    
    var body: some View {
        TabbedView(selection: $selection) {
            AnnivHome()
                .tabItem {
                    Image(systemName: "app.gift")
                    Text("Anniversary")
            }
            .tag(0)
            GiftList()
                .tabItem {
                    Image(systemName: "gift")
                    Text("Gift")
            }
            .tag(1)
            Timeline()
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Timeline")
            }
            .tag(2)
            Setting()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
            }
            .tag(3)
        }
    }
}

#if DEBUG
struct Tab_Previews : PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
#endif
