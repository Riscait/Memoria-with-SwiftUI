import SwiftUI
import Combine

class UserData: BindableObject {
    
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }

    
}
