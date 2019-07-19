import SwiftUI
import Combine

class UserData: BindableObject {
    
    let willChange = PassthroughSubject<Void, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            willChange.send()
        }
    }

    
}
