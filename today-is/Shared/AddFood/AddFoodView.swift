//
//  AddFoodView.swift
//  today-is
//
//  Created by 이주열 on 2022/04/13.
//

import SwiftUI

struct AddFoodView: View {
    @Binding var kindList: [String]
    @Binding var flavorList: [String]
    @State var name: String = ""
    @State var kind1: Int = 0
    @State var kind2: Int = 0
    @State var flavor1: Int = 0
    @State var flavor2: Int = 1
    @State var detailKind: String = ""
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        VStack {
            Button(action: {
                imagePickerPresented.toggle()
            }, label: {
                let image = profileImage == nil ? Image(systemName: "plus.circle") : profileImage ?? Image(systemName: "plus.circle")
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 185, height: 190)
                    .clipShape(Rectangle())
            })
                .padding(.vertical, 20)
            .sheet(isPresented: $imagePickerPresented,
                   onDismiss: loadImage,
                   content: { ImagePicker(image: $selectedImage) }
            )
            
            TextField("음식 이름을 입력해 주세요", text: $name)
            Picker(selection: $kind1, label: Text("첫 번쨰 종류를 입력해 주세요.")) {
                            ForEach(0 ..< kindList.count - 1) {
                                Text(self.kindList[$0])
                            }
                        }
            Picker(selection: $kind2, label: Text("두 번째 종류를 입력해 주세요.")) {
                            ForEach(0 ..< kindList.count) {
                                Text(self.kindList[$0])
                            }
                        }
            Picker(selection: $flavor1, label: Text("첫 번째 맛을 입력해 주세요.")) {
                            ForEach(0 ..< flavorList.count - 1) {
                                Text(self.flavorList[$0])
                            }
                        }
            Picker(selection: $flavor2, label: Text("두 번째맛을 입력해 주세요.")) {
                            ForEach(0 ..< flavorList.count) {
                                Text(self.flavorList[$0])
                            }
                        }
            TextField("정확한 종류를 입력해 주세요.(첫 번째 종류랑 중복되도 됩니다.)", text: $detailKind)
        }
        .padding(.horizontal, 40)
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(kindList: .constant(["한식", "중식", "양식", "일식", "분식", "디저트", "치킨", "피자", "패스트푸드", "인스턴트", "선택안함"]), flavorList: .constant(["짠거", "매운거", "단거", "심심한거", "고소한거", "단백한거", "신거"]))
    }
}
