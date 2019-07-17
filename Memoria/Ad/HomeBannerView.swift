import UIKit
import SwiftUI

import GoogleMobileAds

struct HomeBannerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> BannerViewController {
        return BannerViewController()
    }
    
    func updateUIViewController(_ viewController: BannerViewController, context: Context) {

    }

}

struct HomeBannerView_Preview: PreviewProvider {
    static var previews: some View {
        HomeBannerView()
    }
}

