import SwiftUI

@main
struct MyApp: App {
    
//    init() {
//        let fontURL = Bundle.main.url(forResource: "Chivo-VariableFont_wght", withExtension: "ttf")!
//        CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil)
//      }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                FirstView()
            }
        }
    }
}
