<p align="center">
  <a href="" rel="noopener">
 <img width=300px  src="src/main.png" alt="Project logo"></a>
</p>

<h3 align="center">🏷 TagField 🏷</h3>

<div align="center">

![License](https://img.shields.io/github/license/Changemin/TagField?style=for-the-badge)
![Release](https://img.shields.io/github/v/release/Changemin/TagField?style=for-the-badge)

</div>

---

## 📹 Preview

<p align="center">
    <img src="src/appVideo.gif" width="40%" />
</p>

## 🏁 Getting Started

### Requirements
* Xcode 11+
* SwiftUI
* iOS 14+
* macOS 10.15+

### Installaion
#### Swift Package Manager(SPM)
    File ➜ Swift Packages ➜ Add Package Dependancy..

```Swift
.package(url: "https://github.com/Changemin/TagField", from: "1.1.0")
```

## 🎈Usage
```Swift
TagField(tags: $tags, placeholder: "Add Tags..")
TagField(tags: $tags, placeholder: "Add Tags..", prefix: "#")
TagField(tags: $tags, placeholder: "Add Tags..", prefix: "#", color: color, style: .Modern, lowercase: bool)
```
* `tags` : `Binding<String>` that stores tags data
* `placeholder`: placeholder text before add tags
* `prefix` : prefix attached to each tags
* `color` : accentColor
* `style` : `TagFieldStyle` ➜ `.Modern`, `.RoundedBorder`, `.Multilined`

#### 🛠Custom Modifiers
```Swift
TagField(tags: $tags, placeholder: "Add Tags..")
    .accentColor(color)
    .styled(TagFieldStyle)
    .lowercase(Bool)
```
* `.accentColor()` : Accent color
* `.styled()` : `.RoundedBorder(default)` `.Modern` `.Multilined(on progress)` support different designs
* `.lowercase` : enable force lowercase
## Example
#### 👶 Simple
```Swift
import TagField

struct ContentView: View {
    @State var tags: [String] = []
    
    var body: some View {
        TagField(tags: $tags, placeholder: "Add Tags..")
            .padding()
    }
}
```
#### Result
<p float="left">
    <img src="src/Example-simple-1.png" width="25%">
    <img src="src/Example-simple-2.png" width="25%">
</p>

### Styling
```Swift
import TagField

struct ContentView: View {
    @State var tags: [String] = []
    
    var body: some View {
        TagField(tags: $tags, placeholder: "Add Tags..", prefix: "#")
            .styled(.Modern)
            .accentColor(.red)
            .lowercase(true)
            .padding()
    }
}
```

### Result
<p float="left">
    <img src="src/Example-styling-1.png" width="25%">
    <img src="src/Example-styling-2.png" width="25%">
</p>

## ✅ TODO
- [ ] `Multilined` style

## 📜 License

TagField is available under the MIT license. See the `LICENSE` file for more info.

## ✍️ Author

- Byun Kyung Min ➜ [🇰🇷@Changemin](https://github.com/Changemin)
