import SwiftUI

struct CarouselCell: View {
    @State var isOpen: [Int: Bool] = [:]
    let categoryName: String

    var body: some View {
        VStack {
            // Інші елементи вашої візуалізації
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(1..<10) { i in
                        ZStack {
                            BackView(id: i)
                                .rotation3DEffect(.degrees(self.isOpen[i] ?? true ? 180 : 0), axis: (x:0, y:1, z:0))
                                .zIndex(self.isOpen[i] ?? true ? 0 : 1)
                            
                            FrontView(id: i)
                                .rotation3DEffect(.degrees(self.isOpen[i] ?? true ? 0 : 180), axis: (x:0, y:-1, z:0))
                                .zIndex(self.isOpen[i] ?? true ? 1 : 0)
                        }
                        .gesture(TapGesture()
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    if self.isOpen[i] == nil {
                                        self.isOpen[i] = false
                                    } else {
                                        for key in isOpen.keys {
                                            isOpen[key] = true
                                        }
                                        self.isOpen[i]?.toggle()
                                    }
                                    
                                }
                            }
                                )
                        }
                    }
                }
            }
        }
//    func getScale(proxy: GeometryProxy) -> CGFloat {
//        let midPoint: CGFloat = 50
//
//        let viewFrame = proxy.frame(in: CoordinateSpace.global)
//
//        var scale: CGFloat = 1
//
//        let deltaXAnimationThreshold: CGFloat = 50
//
//        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
//        if diffFromCenter < deltaXAnimationThreshold {
//            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 400
//        }
//
//        return scale
//    }
}
struct FrontView: View {
    var id = 0
    var category = "Стендап"
    var shortDescription = "ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС "
    var imgUrl = "https://hws.dev/paul.jpg"
    var credo = "КРЕДО"
    
    var body: some View {
        VStack(spacing: 8.0) {
            GroupBox(
                label: Label(category, systemImage:"paperplane")
                    .foregroundColor(.red)
            ) {
                AsyncImage(url: URL(string: imgUrl)) {
                    image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100, alignment: .leading)
                
            
                Text(shortDescription)
                    .frame(height: 200.0)
                Text(credo)
            }
        }
        .padding(.vertical, 32)
        .frame(width: 320, height: 400)
        .padding(.horizontal, 32)
    }
}

struct BackView: View {
    var id = 0
    var category = "FFFFF"
    var description = "ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС "
    
    var body: some View {
        VStack(spacing: 8.0) {
            GroupBox(
                label: Label(category, systemImage:"paperplane")
                    .foregroundColor(.red)
            ) {
                Text(description)
                    .frame(height: 300.0)
            }
        }
        .padding(.vertical, 32)
        .frame(width: 320, height: 400)
        .padding(.horizontal, 32)
    }
}


struct CarouselCell_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCell(categoryName: "")
    }
}
