import SwiftUI
import UIKit

// MARK: - KART EKRANI

struct ikinciSayfa: View {
    var name: String
    var ionayDr: String
    var idYeri: String
    var idTarihi = Date()
    var ikangrubu: String

    @Environment(\.dismiss) private var kapat
    @State private var kartResmi: UIImage?

    // Kart her zaman beyaz zeminli; karanlık modda da okunaklı kalsın diye sabit renkler.
    private let kartMetin = Color(red: 0.16, green: 0.12, blue: 0.12)
    private let kartIkincil = Color(red: 0.47, green: 0.40, blue: 0.38)
    private let kartKirmizi = Color(red: 0.72, green: 0.10, blue: 0.10)

    var body: some View {
        ZStack {
            arkaPlan
            cerceve
        }
        .toolbar(.hidden, for: .navigationBar)
        .task { kartResmi = renderKarti() }
        .environment(\.locale, Locale(identifier: "tr_TR"))
    }

    // MARK: Çerçeve

    private var cerceve: some View {
        VStack(spacing: 0) {
            ustBaslik

            GeometryReader { geo in
                ScrollView {
                    VStack(spacing: 16) {
                        kartGorunumu
                        paylasButonu
                        ipucu
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 18)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: geo.size.height, alignment: .center)
                }
            }
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
        HStack(spacing: 10) {
            Button {
                kapat()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Tema.anaRenk)
                    .frame(width: 32, height: 32)
                    .background(Tema.anaRenk.opacity(0.10))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 1) {
                Text("Kartınız hazır")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundStyle(Tema.metin)

                Text("Önizleyin, kaydedin veya paylaşın")
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(Tema.ikincil)
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .padding(.bottom, 10)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Tema.cizgi)
                .frame(height: 0.8)
        }
    }

    // MARK: Kart önizleme

    @ViewBuilder
    private var kartGorunumu: some View {
        if let kartResmi {
            Image(uiImage: kartResmi)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.14), radius: 18, x: 0, y: 8)
                .frame(maxWidth: 400)
                .frame(maxWidth: .infinity)
        } else {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Tema.alan)
                .aspectRatio(1.6, contentMode: .fit)
                .overlay(
                    ProgressView()
                        .tint(Tema.anaRenk)
                )
                .frame(maxWidth: 400)
                .frame(maxWidth: .infinity)
        }
    }

    @ViewBuilder
    private var paylasButonu: some View {
        if let kartResmi {
            ShareLink(item: Image(uiImage: kartResmi),
                      preview: SharePreview("Kan Grubu Kartı",
                                            image: Image(uiImage: kartResmi))) {
                HStack(spacing: 8) {
                    Image(systemName: "square.and.arrow.up")
                    Text("Kartı Paylaş veya Kaydet")
                }
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Tema.anaGecis)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Tema.anaRenk.opacity(0.30), radius: 10, x: 0, y: 6)
            }
        }
    }

    private var ipucu: some View {
        Text("Kart, paylaşım sayfasından Fotoğraflar'a kaydedilebilir.")
            .font(.system(size: 11, weight: .medium, design: .rounded))
            .foregroundStyle(Tema.ikincil.opacity(0.85))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
    }

    // MARK: Kart tasarımı (paylaşılan görsel)

    @MainActor
    private var kanGrubuKarti: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(kartKirmizi.opacity(0.12))
                        .frame(width: 24, height: 24)

                    Image(systemName: "cross.case.fill")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(kartKirmizi)
                }

                Text("Kayakyolu Aile Sağlık Merkezi")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(kartMetin)

                Spacer(minLength: 0)

                Image(systemName: "heart.text.square.fill")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(kartKirmizi.opacity(0.55))
            }

            Text("Kan Grubu Kartı")
                .font(.system(size: 27, weight: .bold, design: .rounded))
                .foregroundStyle(kartKirmizi)

            Rectangle()
                .fill(kartKirmizi.opacity(0.15))
                .frame(height: 1)

            satir("Adı Soyadı", deger(name))
            satir("Doğum Tarihi", idTarihi.formatted(.dateTime.day().month(.twoDigits).year()))
            satir("Doğum Yeri", deger(idYeri))

            HStack(spacing: 8) {
                Text("Kan Grubu")
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
                    .foregroundStyle(kartIkincil)
                    .frame(width: 86, alignment: .leading)

                Text(deger(ikangrubu))
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundStyle(kartKirmizi)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                    .background(kartKirmizi.opacity(0.10))
                    .clipShape(Capsule())

                Spacer(minLength: 0)
            }

            satir("Onaylayan", deger(ionayDr))
        }
        .padding(18)
        .frame(width: 400, height: 250, alignment: .topLeading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(kartKirmizi.opacity(0.85), lineWidth: 2.5)
        )
    }

    private func satir(_ etiket: String, _ icerik: String) -> some View {
        HStack(spacing: 8) {
            Text(etiket)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .foregroundStyle(kartIkincil)
                .frame(width: 86, alignment: .leading)

            Text(icerik)
                .font(.system(size: 12.5, weight: .semibold, design: .rounded))
                .foregroundStyle(kartMetin)
                .lineLimit(1)
                .minimumScaleFactor(0.7)

            Spacer(minLength: 0)
        }
    }

    private func deger(_ metin: String) -> String {
        let temiz = metin.trimmingCharacters(in: .whitespacesAndNewlines)
        return temiz.isEmpty ? "—" : temiz
    }

    // MARK: Görünümü resme çevir

    @MainActor
    private func renderKarti() -> UIImage? {
        let renderer = ImageRenderer(content: kanGrubuKarti)
        renderer.scale = 3.0
        return renderer.uiImage
    }
}
