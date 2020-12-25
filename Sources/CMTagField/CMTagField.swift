import SwiftUI

public struct CMTagField : View{
    @Binding public var tags: [String]
    @State private var newTag: String = ""
    @State var color: Color = .blue
    private var placeholder: String = ""
    private var prefix: String = ""
    private var style: CMTagFieldStyle = .RoundedBorder
    private var lowercase: Bool = true
    
    public var body: some View {
        VStack(spacing: 0){
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
                        }
                        
                        TextField(placeholder, text: $newTag, onEditingChanged: { _ in
                            appendNewTag()
                        }, onCommit: {
                            appendNewTag()
                        })
                            .onChange(of: newTag) { change in
                                if(change.isContainSpaceAndNewlines()) {
                                    appendNewTag()
                                }
                                withAnimation(Animation.easeOut(duration: 0).delay(1)) {
                                    scrollView.scrollTo("TextField", anchor: .trailing)
                                }
                                
                            }
                            .fixedSize()
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .accentColor(color)
                            .id("TextField")
                            .padding(.trailing)
                    }.padding()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: style == .RoundedBorder ? 0.75 : 0)
                )
            }.background(
                color.opacity(style == .Modern ? 0.07 : 0)
            )
            if(style == .Modern) {
                color.frame(height: 2).cornerRadius(1)
            }
            
        }
        
    }
    func appendNewTag() {
        var tag = newTag
        if(!isBlank(tag: tag)) {
            if(tag.last == " ") {
                tag.removeLast()
                if(!isOverlap(tag: tag)) {
                    if(lowercase) {
                        tag = tag.lowercased()
                    }
                    withAnimation() {
                        tags.append(tag)
                    }
                }
            }
            else {
                if(!isOverlap(tag: tag)) {
                    if(lowercase) {
                        tag = tag.lowercased()
                    }
                    withAnimation() {
                        tags.append(tag)
                    }
                }
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
    func isBlank(tag: String) -> Bool {
        let tmp = tag.trimmingCharacters(in: .whitespaces)
        if(tmp == "") {
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
    
    public init(tags: Binding<[String]>, placeholder: String, prefix: String) {
        self._tags = tags
        self.placeholder = placeholder
        self.prefix = prefix
    }
    
    public init(tags: Binding<[String]>, prefix: String, placeholder: String, color: Color, style: CMTagFieldStyle, lowercase: Bool) {
        self._tags = tags
        self.prefix = prefix
        self.placeholder = placeholder
        self._color = .init(initialValue: color)
        self.style = style
        self.lowercase = lowercase
    }
}

public extension CMTagField {
    func accentColor(_ color: Color) -> CMTagField {
        CMTagField(tags: self.$tags,
                   prefix: self.prefix,
                   placeholder: self.placeholder,
                   color: color,
                   style: self.style,
                   lowercase: self.lowercase)
    }
    func styled(_ style: CMTagFieldStyle) -> CMTagField {
        CMTagField(tags: self.$tags,
                   prefix: self.prefix,
                   placeholder: self.placeholder,
                   color: self.color,
                   style: style,
                   lowercase: self.lowercase)
    }
    func downcase(_ bool: Bool) -> CMTagField {
        CMTagField(tags: self.$tags,
                   prefix: self.prefix,
                   placeholder: self.placeholder,
                   color: self.color,
                   style: self.style,
                   lowercase: bool)
    }
}
