<img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/49672a35-d4d2-406c-89b8-52d20dddcd27" width="50" alt="앱아이콘" />

## RandomDine
#### "뭘 먹어야 하지?" 고민부터 시작해 탄생한 앱입니다.
#### 내 주변 음식점을 무작위로 추천하여 선택 장애를 해결합니다.
#### Kakao API를 활용해 내 위치 중심으로 설정한 거리에 따라 무작위 음식점 정보를 제공합니다.

#### Download : [<img src="https://img.shields.io/badge/apple-%23000000.svg?&style=for-the-badge&logo=apple&logoColor=white" />](https://apps.apple.com/kr/app/randomdine/id6477853120) 
#### Targets : iPad:17.1, iOS:17.1 이상


<Table align = "center">
  <tr>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/061c9eb5-8f2c-4a4c-983d-33bb86894877" width="200" alt="추천받기" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/f20a37e5-60f4-4b66-88da-e5cba9bc34f9" width="200" alt="즐겨찾기" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/94871d10-f72f-428a-ba68-cdc5b11ccd9c" width="200" alt="가게정보 표출" /></td>
    <td><img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/02e48b30-2d70-4d03-a8f5-459e6691c9f0" width="200" alt="설정" /></td>
  </tr>
  <tr align="center">
    <td>추천받기</td>
    <td>즐겨찾기</td>
    <td>가게정보 보기</td>
    <td>설정</td>
  </tr>
</Table>

## Skills
- SwiftUI
- MVVM 
- Cobmine 
- KaKaoMap Local API 
- Swift Lint 
- CoreData
- Git Flow

## Funtions
<Table>
  <tr>
    <td align = "center">
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/fba17168-d9d2-4c05-a537-231d76d66aa8" width="150" alt="설정" />
    </td>
    <td valign= "top">
      <p>
        <h2> 홈 </h2>
        <li> 메인 화면으로 추천받기 버튼 및 저장된 즐겨찾기 리스트가 출력됩니다. </li>
        <li> 오른쪽 상단위 톱니 Symbol을 터치해 환경설정뷰로 이동됩니다. </li>
      </p>
    </td>
  </tr>
  
  <tr>
    <td align = "center">
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/061c9eb5-8f2c-4a4c-983d-33bb86894877" width="150" alt="추천받기" />
    </td>
    <td valign= "top">
      <p>
       <h2> 추천받기</h2>
       <li> 사용자 위치 기준으로 설정된 거리에 따라 랜덤하게 가게정보를 받아옵니다.</li>
       <li> Combine으로 비동기 핸들링 기능을 구현했습니다 </li>
       <li> 사용 API는 KaKao Local API를 사용했습니다.</li>
       <li> UX를 고려해 API통신이 끝나기 전까지 음식 아이콘이 표출됩니다. Combine Publisher Scheduler를 이용했습니다.</li>
      </p>
    </td>
  </tr>

  <tr>
    <td align = "center">
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/f20a37e5-60f4-4b66-88da-e5cba9bc34f9" width="150" alt="즐겨찾기" />
    </td>
    <td valign= "top">
      <p>
       <h2> 즐겨찾기 </h2>
       <li> 추천받은 가게정보를 사용자가 별아이콘 터치만으로 즐겨찾기에 추가할 수 있습니다.</li>
       <li> 삭제의 경우 별아이콘을 다시 터치하거나 홈 화면에서 스와이프 동작으로 제거할 수 있습니다. </li>
       <li> CoreData를 활용해 데이터 Persistence를 구축했습니다.</li>
      </p>
    </td>
  </tr>

  <tr>
    <td align = "center">
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/94871d10-f72f-428a-ba68-cdc5b11ccd9c" width="150" alt="가게정보 보기" />
    </td>
    <td align="left" valign="top">
      <p>
       <h2> 가게정보 보기</h2>
       <li> 홈 화면에서 즐겨찾기 항목을 터치하거나, 추천받기뷰에 출력된 아이템에서 이동 가능합니다. </li>
       <li> SafarWebView에 추천된 가게 URL이 전달되며 카카오맵 웹 페이지로 가게정보를 볼 수 있습니다. </li>
      </p>
    </td>
  </tr>

  <tr align = "center">
    <td>
      <img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/02e48b30-2d70-4d03-a8f5-459e6691c9f0" width="150" alt="설정" />
    </td>
   <td align="left" valign="top">
      <p>
       <h2> 설정 </h2>
       <li> 사용자가 설정한 거리에따라 음식춤이 됩니다. </li>
       <li> 사용자의 설정 거리에따른 정보가 API request parameter로 전달 됩니다.</li> 
       <li> 사용자가 위치정보를 제공 여부 설정을 쉽게 할 수 있게 기능을 제공하고 있습니다. </li>
      </p>
    </td>
  </tr>
</Table>

## File tree
```
sources
├─ RandomDine
│  ├─ Application
│  ├─ Data
│  │  ├─ DTO
│  │  ├─ Network
│  │  └─ Persistence
│  ├─ Extension
│  ├─ Presentation
│  │  ├─ Components
│  │  ├─ RecommendFoodStoreScene
│  │  │  ├─ View
│  │  │  └─ ViewModel
│  │  └─ SettingScene
│  ├─ Resource
│  └─ Utility
├─ ci_scripts
└─ .swiftlint.yml
```
