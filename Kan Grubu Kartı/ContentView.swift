import SwiftUI
import UIKit

// MARK: - TEMA

enum Tema {
    static let arkaPlanUst = dinamik(0xFFF7F5, 0x140B0B)
    static let arkaPlanAlt = dinamik(0xFBE4E0, 0x1F1211)

    static let zemin = dinamik(0xFFFBFA, 0x120D0D)
    static let kart = dinamik(0xFFFFFF, 0x1C1414)
    static let alan = dinamik(0xFBF3F1, 0x251716)
    static let cizgi = dinamik(0xF3DDD8, 0x3B2725)

    static let metin = dinamik(0x2A1414, 0xFFF4F2)
    static let ikincil = dinamik(0x7E6460, 0xC6A7A2)

    static let anaRenk = dinamik(0xC62828, 0xFF7A6E)
    static let anaRenkAcik = dinamik(0xE5533D, 0xFFA48F)

    static var anaGecis: LinearGradient {
        LinearGradient(colors: [anaRenk, anaRenkAcik],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }

    private static func dinamik(_ aydinlik: UInt32, _ karanlik: UInt32) -> Color {
        Color(uiColor: UIColor { trait in
            UIColor(hex: trait.userInterfaceStyle == .dark ? karanlik : aydinlik)
        })
    }
}

private extension UIColor {
    convenience init(hex: UInt32) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255,
            green: CGFloat((hex >> 8) & 0xFF) / 255,
            blue: CGFloat(hex & 0xFF) / 255,
            alpha: 1
        )
    }
}

// MARK: - GİRİŞ EKRANI

struct ContentView: View {
    @EnvironmentObject private var dil: Yerellestirme

    @State private var adSoyad = ""
    @State private var dogumYeri = ""
    @State private var dogumTarihi = Date()
    @State private var kanGrubu = ""
    @State private var onaylayan = ""
    @State private var bilgiAcik = false

    var body: some View {
        NavigationStack {
            ZStack {
                arkaPlan
                cerceve
            }
            .toolbar(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(dil.metin("ortak.bitti")) {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                        to: nil, from: nil, for: nil)
                    }
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
            }
            .sheet(isPresented: $bilgiAcik) {
                BilgiSayfasi()
            }
        }
        .tint(Tema.anaRenk)
    }

    // MARK: Çerçeve

    private var cerceve: some View {
        VStack(spacing: 0) {
            ustBaslik

            ScrollView {
                VStack(spacing: 14) {
                    bilgiKarti
                    kartButonu
                    ipucu
                }
                .padding(.horizontal, 16)
                .padding(.top, 14)
                .padding(.bottom, 18)
            }
            .scrollDismissesKeyboard(.interactively)

            BilgiBari(acik: $bilgiAcik)
        }
        .background(Tema.zemin)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(Tema.cizgi, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.10), radius: 24, x: 0, y: 12)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(maxWidth: 620, maxHeight: .infinity)
    }

    private var arkaPlan: some View {
        ZStack {
            LinearGradient(colors: [Tema.arkaPlanUst, Tema.arkaPlanAlt],
                           startPoint: .top,
                           endPoint: .bottom)

            Circle()
                .fill(Tema.anaRenk.opacity(0.16))
                .frame(width: 300, height: 300)
                .blur(radius: 80)
                .offset(x: -140, y: -280)

            Circle()
                .fill(Tema.anaRenkAcik.opacity(0.14))
                .frame(width: 260, height: 260)
                .blur(radius: 80)
                .offset(x: 160, y: -180)
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }

    private var ustBaslik: some View {
        VStack(spacing: 7) {
            ZStack {
                Circle()
                    .fill(Tema.anaGecis)
                    .frame(width: 46, height: 46)
                    .shadow(color: Tema.anaRenk.opacity(0.35), radius: 12, x: 0, y: 7)

                Image(systemName: "drop.fill")
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundStyle(.white)
            }

            Text(dil.metin("kg.baslik"))
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundStyle(Tema.metin)

            Text(dil.metin("kg.altbaslik"))
                .font(.system(size: 11.5, weight: .medium, design: .rounded))
                .foregroundStyle(Tema.ikincil)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 12)
        .padding(.bottom, 10)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Tema.cizgi)
                .frame(height: 0.8)
        }
    }

    private var bilgiKarti: some View {
        VStack(alignment: .leading, spacing: 12) {
            BolumBasligi(ikon: "person.text.rectangle.fill", baslik: dil.metin("kg.kisiBilgileri"))

            AlanSatiri(baslik: dil.metin("kg.adSoyad"),
                       placeholder: dil.metin("kg.adSoyadIpucu"),
                       metin: $adSoyad)

            AlanSatiri(baslik: dil.metin("kg.dogumYeri"),
                       placeholder: dil.metin("kg.dogumYeriIpucu"),
                       metin: $dogumYeri)

            VStack(alignment: .leading, spacing: 5) {
                Text(dil.metin("kg.dogumTarihi"))
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
                    .foregroundStyle(Tema.ikincil)

                DatePicker(dil.metin("kg.dogumTarihi"),
                           selection: $dogumTarihi,
                           displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.compact)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 12)
                    .background(Tema.alan)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Tema.cizgi, lineWidth: 1)
                    )
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(dil.metin("kg.kanGrubu"))
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
                    .foregroundStyle(Tema.ikincil)

                KanGrubuSecici(secilenKanGrubu: $kanGrubu)
            }

            AlanSatiri(baslik: dil.metin("kg.onaylayan"),
                       placeholder: dil.metin("kg.onaylayanIpucu"),
                       metin: $onaylayan)
        }
        .padding(16)
        .background(Tema.kart)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Tema.cizgi, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 16, x: 0, y: 8)
    }

    private var kartButonu: some View {
        NavigationLink {
            ikinciSayfa(name: adSoyad,
                        ionayDr: onaylayan,
                        idYeri: dogumYeri,
                        idTarihi: dogumTarihi,
                        ikangrubu: kanGrubu)
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "rectangle.portrait.on.rectangle.portrait.fill")
                Text(dil.metin("kg.kartiGoster"))
            }
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Tema.anaGecis)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: Tema.anaRenk.opacity(0.30), radius: 10, x: 0, y: 6)
        }
        .buttonStyle(.plain)
    }

    private var ipucu: some View {
        Text(dil.metin("kg.ipucu"))
            .font(.system(size: 11, weight: .medium, design: .rounded))
            .foregroundStyle(Tema.ikincil.opacity(0.85))
            .frame(maxWidth: .infinity)
    }
}

// MARK: - YARDIMCI GÖRÜNÜMLER

struct BolumBasligi: View {
    let ikon: String
    let baslik: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: ikon)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(Tema.anaRenk)

            Text(baslik)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1.1)
                .foregroundStyle(Tema.ikincil)

            Spacer(minLength: 0)
        }
    }
}

struct AlanSatiri: View {
    let baslik: String
    let placeholder: String
    @Binding var metin: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(baslik)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .foregroundStyle(Tema.ikincil)

            TextField(placeholder, text: $metin)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundStyle(Tema.metin)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled()
                .padding(.vertical, 10)
                .padding(.horizontal, 12)
                .background(Tema.alan)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Tema.cizgi, lineWidth: 1)
                )
        }
    }
}

// MARK: - ÖNİZLEME

#Preview {
    ContentView()
        .environmentObject(Yerellestirme())
}
