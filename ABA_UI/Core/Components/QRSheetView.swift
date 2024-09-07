import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let payment = "00020101021129450016abaakhppxxx@abaa01090024902990208ABA Bank40390006abaP2P01129B44C11C847502090024902995204000053038405802KH5911KOUERN DOCH6010Phnom Penh630414D3"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray.opacity(0.8))
                            .padding()
                    }
                }
                
                HStack {
                    Image("ABALogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                    Text("QR")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 10) {
                    Text("ប្រើ QR នេះ ដើម្បីទទួលប្រាក់មិត្តភ័ត្ត ឬ")
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    HStack {
                        Text("ផ្ទេរប្រាក់ពីអេបធនាគារផ្សេងរបស់អ្នក")
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        Button(action: {
                            
                        }) {
                            Image(systemName: "info.circle")
                                .font(.system(size: 16))
                                .foregroundColor(Color(red: 0.507, green: 0.906, blue: 0.863))
                        }
                    }
                }
                .background(Color.clear)
                
                Spacer()

                ZStack(alignment: .topLeading) {
                    Image("KHQR")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("KOUERN DOCH")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)

                        Text("$0.00")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 70)
                    .padding(.leading, 30)
                    
                    Image(uiImage: generateQRCode(from: "\(payment)"))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(height: 185)
                        .padding(.top, 140)
                        .padding(.leading, 30)
                }
                .frame(height: 300)
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 16))
                        
                        // Text
                        Text("បញ្ចូលចំនួនទឹកប្រាក់")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                    }
                    .foregroundColor(Color(red: 0.507, green: 0.906, blue: 0.863))
                    .padding()
                    .frame(maxWidth: 250)
                    .background(Color(red: 0.11, green: 0.118, blue: 0.118))
                    .cornerRadius(7)
                }
                .padding(.top, 10)
                
                HStack {
                    Text("ទទួលទៅ:")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.gray)
                    Text("002 490 299 | USD")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(Color(red: 0.507, green: 0.906, blue: 0.863))
                }
                .padding(.bottom, 20)

                HStack(spacing: 60) {
                    IconView(imageName: "square.and.arrow.down", label: "ទាញយក") {
                        print("Download button tapped!")
                    }

                    IconView(imageName: "dot.circle.viewfinder", label: "ថតអេក្រង់") {
                        print("Screenshot button tapped!")
                    }

                    IconView(imageName: "link", label: "ផ្ងើរលីង") {
                        print("Share link button tapped!")
                    }

                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct IconView: View {
    var imageName: String
    var label: String
    var action: () -> Void

    var body: some View {
        VStack {
            Button(action: {
                action()
            }) {
                ZStack {
                    Circle()
                        .fill(Color(red: 0.208, green: 0.216, blue: 0.22))
                        .frame(width: 50, height: 50)

                    Image(systemName: imageName)
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            
            Text(label)
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}



#Preview {
    QRSheetView()
}
