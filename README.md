# MemoAmplifier

**MemoAmplifier** is a lightweight Swift app designed to help users capture and organize quick notes with ease.  
Built for macOS and iOS, it offers a clean and simple way to create, edit, and manage memos without distraction.

## Features

- Create and edit memos on the fly
- Organize your memos clearly
- Native Swift app for macOS and iOS
- Minimalistic and intuitive UI
- SwiftUI-based for seamless cross-device experience

## Technologies

- Swift
- SwiftUI
- Combine (if applicable)
- CoreData (if applicable)
- CodableCSV
- Xcode 15+

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/paullstanley/MemoAmplifier.git
   cd MemoAmplifier
   ```

2. Open the project in Xcode:
   - Open `MemoAmplifier.xcodeproj`.

3. Ensure dependencies are installed:
   - This project uses [CodableCSV](https://github.com/dehesa/CodableCSV) for CSV handling.
   - If needed, add it via Swift Package Manager:
     - In Xcode: **File > Swift Packages > Add Package Dependency**  
     - Use the URL: `https://github.com/dehesa/CodableCSV.git`

4. Build and run the app.

## Notes

- CodableCSV is a powerful library that provides both imperative and declarative (Codable) CSV parsing and writing.
- No external services are required; everything runs locally on your device.

## License

This project is licensed under the [MIT License](LICENSE).

## Author

Created by [Paull Stanley](https://github.com/paullstanley).
