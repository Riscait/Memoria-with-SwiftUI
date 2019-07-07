import SwiftUI

/// 記念日をカテゴリ毎に表示するホーム画面
struct AnnivHome : View {
    enum Section {
        case featured
        case anniv
        case birthday
        case passed
    }
    
    var featuredAnniv: [Anniv] {
        annivs.filter {
            if case Anniv.Category.birthday = $0.category {
                return $0.isFeatured
            }
            return false
        }
    }
    
    var featuredBirthday: [Anniv] {
        annivs.filter {
            if case Anniv.Category.anniv = $0.category {
                return $0.isFeatured
            }
            return false
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedAnnivs(annivs: featuredAnniv)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                CategoryRow(categoryName: "Birthday", annivs: annivs)
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing:
                PresentationLink(destination: Text("Editer")) {
                    Image(systemName: "slider.horizontal.3")
                        .imageScale(.large)
                        .accessibility(label: Text("Edit"))
            })
        }
    }
}

struct FeaturedAnnivs: View {
    var annivs: [Anniv]
    var body: some View {
        Image("BirthdayBackgroundSample").resizable()
    }
}

#if DEBUG
struct AnnivList_Previews : PreviewProvider {
    static var previews: some View {
        AnnivHome()
    }
}
#endif
