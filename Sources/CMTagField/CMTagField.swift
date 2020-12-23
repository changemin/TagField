import SwiftUI

public struct CMTagField : View{
    @Binding public var tags: [String]
    @State public var prefix: String = ""
    @State private var newTag: String = ""
    @State var color: Color = .blue
    var placeholder: String = ""
    
    public var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(tags, id: \.self) { tag in
                        HStack {
                            Text("\(prefix + tag)")
                                .fixedSize()
                                .foregroundColor(color.opacity(0.8))
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .padding([.leading], 10)
                                .padding(.vertical, 5)
                            Button(action :{
                                withAnimation() {
                                    tags.removeAll { $0 == tag }
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(color.opacity(0.8))
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .padding([.trailing], 10)
                            }
                        }.background(color.opacity(0.1).cornerRadius(.infinity))
                        .id(tag)
                    }
                    TextField(placeholder, text: $newTag)
                        .onChange(of: newTag) { change in
                            if(change.isContainSpaceAndNewlines()) {
                                appendNewTag()
                                withAnimation() {
                                    scrollView.scrollTo("TextField", anchor: .center)
                                }
                                
                            }
                        }
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .accentColor(color)
                        .id("TextField")
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 0.75)
            )
        }
        
    }
    func appendNewTag() {
        let tag = newTag
        print(tag)
        if(!isOverlap(tag: tag)) {
            withAnimation() {
                tags.append(tag)
            }
        }
        newTag.removeAll()
    }
    func isOverlap(tag: String) -> Bool {
        if(tags.contains(tag)) {
            return true
        }
        else {
            return false
        }
    }
    public init(tags: Binding<[String]>, placeholder: String) {
        self._tags = tags
        self.placeholder = placeholder
    }
    
    public init(tags: Binding<[String]>, prefix: String, placeholder: String, color: Color) {
        self._tags = tags
        self.prefix = prefix
        self.placeholder = placeholder
        self._color = .init(initialValue: color)
    }
}

public extension CMTagField {
    func accentColor(_ color: Color) -> CMTagField {
        CMTagField(tags: self.$tags, prefix: self.prefix, placeholder: self.placeholder, color: color)
    }
}
