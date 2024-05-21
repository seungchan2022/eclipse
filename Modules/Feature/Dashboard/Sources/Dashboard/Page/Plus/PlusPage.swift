import Architecture
import Domain
import ComposableArchitecture
import SwiftUI
import DesignSystem

struct PlusPage {
  private let store: StoreOf<PlusStore>
  @ObservedObject private var viewStore: ViewStoreOf<PlusStore>
  
  init(store: StoreOf<PlusStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension PlusPage { }

extension PlusPage: View {
  var body: some View {
    VStack(spacing: .zero) {
      DesignSystemNavigation(
        barItem: .init(title: "만들기"))
      {
          Divider()
        
        VStack(alignment: .leading, spacing: 4) {
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.play.image
                .resizable()
                .scaledToFit()
                .frame(width: 32, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
                
              
              Text("릴스")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.grid.image
                .resizable()
                .scaledToFit()
                .frame(width: 32, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
                
              
              Text("게시물")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.story.image
                .resizable()
                .scaledToFit()
                .frame(width: 32, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
                
              
              Text("스토리")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.highlight.image
                .resizable()
                .scaledToFit()
                .frame(width: 32, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
                
              
              Text("스토리 하이라이트")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.live.image
                .resizable()
                .scaledToFit()
                .frame(width: 32, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
                
              
              Text("라이브 방송")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.customPlay.image
                .resizable()
                .scaledToFit()
                .frame(width: 32, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
                
              
              Text("회원님을 위해 생성된 릴스")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }


        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
      }
    }
    .navigationTitle("")
    .navigationBarBackButtonHidden(true)
  }
}
