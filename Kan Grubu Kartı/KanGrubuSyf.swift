import SwiftUI

// MARK: - KAN GRUBU SEÇİCİ

struct KanGrubuSecici: View {
    @EnvironmentObject private var dil: Yerellestirme

    @Binding var secilenKanGrubu: String

    // Kan grubu gösterimi uluslararası "Rh" gösterimidir; çeviri gerektirmez.
    private let kanGruplari = [
        "A Rh+", "B Rh+", "AB Rh+", "O Rh+",
        "A Rh−", "B Rh−", "AB Rh−", "O Rh−"
    ]

    var body: some View {
        Menu {
            ForEach(kanGruplari, id: \.self) { item in
                Button {
                    secilenKanGrubu = item
                } label: {
                    if item == secilenKanGrubu {
                        Label(item, systemImage: "checkmark")
                    } else {
                        Text(item)
                    }
                }
            }
        } label: {
            HStack(spacing: 8) {
                Text(secilenKanGrubu.isEmpty ? dil.metin("kg.kanGrubuSec") : secilenKanGrubu)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundStyle(secilenKanGrubu.isEmpty ? Tema.ikincil : Tema.metin)
                    .lineLimit(1)

                Spacer(minLength: 0)

                Image(systemName: "chevron.up.chevron.down")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(Tema.anaRenk)
            }
            .padding(.vertical, 11)
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
