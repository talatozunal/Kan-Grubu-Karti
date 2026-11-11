import SwiftUI

// MARK: - KAN GRUBU SEÇİCİ

struct KanGrubuSecici: View {
    @Binding var secilenKanGrubu: String

    private let kanGruplari = [
        "A Grubu RH +", "B Grubu RH +", "AB Grubu RH +", "O Grubu RH +",
        "A Grubu RH -", "B Grubu RH -", "AB Grubu RH -", "O Grubu RH -"
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
                Text(secilenKanGrubu.isEmpty ? "Kan grubu seçin" : secilenKanGrubu)
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
