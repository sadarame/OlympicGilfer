//
//  AdView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/05/09.
//

import SwiftUI
import GoogleMobileAds

struct AdMobView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        // 以下は、バナー広告向けのテスト専用広告ユニットIDです。自身の広告ユニットIDと置き換えてください。
//        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        
        //本物
        banner.adUnitID = "ca-app-pub-5529798279445729/3568637709"
        
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}


struct AdView: View {
    var body: some View {
        AdMobView() .frame(maxWidth: .infinity, maxHeight: 80, alignment: Alignment.center)
    }
}

struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        AdView()
    }
}
