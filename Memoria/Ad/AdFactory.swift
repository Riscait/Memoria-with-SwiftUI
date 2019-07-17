import Foundation

import GoogleMobileAds

struct AdFactory {
    
    enum Size {
        case banner
        case largeBanner
        case mediumRectangle
        case fullBanner
        case leaderboard
        case smartBannerPortrait
        case smartBannerLandscape
        case custom(size: CGSize)
        
        var adSize: GADAdSize {
            switch self {
            case .banner: return kGADAdSizeBanner
            case .largeBanner: return kGADAdSizeLargeBanner
            case .mediumRectangle: return kGADAdSizeMediumRectangle
            case .fullBanner: return kGADAdSizeFullBanner
            case .leaderboard: return kGADAdSizeLeaderboard
            case .smartBannerPortrait:return kGADAdSizeSmartBannerPortrait
            case .smartBannerLandscape: return kGADAdSizeSmartBannerLandscape
            case .custom(let size): return GADAdSizeFromCGSize(size)
            }
        }
    }

    static func makeAdBanner(on view: UIView, size: Size) -> GADBannerView {
        let banner = GADBannerView(adSize: size.adSize)
        banner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(banner)
        banner.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        banner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return banner
    }
}
