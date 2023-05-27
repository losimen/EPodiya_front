import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                CarouselCell(categoryName: "")
            }.navigationBarTitle("Browse", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
