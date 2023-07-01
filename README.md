# Good Boys Catalogue

Flutter demo application that utilizes best practices for building Flutter mobile apps.

Displays dog breeds info from [Dog API](https://thedogapi.com/)

## Tech stack
* Architecture design pattern: [BLoC](https://bloclibrary.dev/)
* Navigation: [go_router](https://pub.dev/packages/go_router)
* Localization: [flutter_localizations](https://docs.flutter.dev/accessibility-and-localization/internationalization#setting-up)
* [dio](https://pub.dev/packages/dio) as HTTP client
* [isar](https://pub.dev/packages/isar) as NoSQL local database
* [get_it](https://pub.dev/packages/get_it) as Service Locator
* [freezed](https://pub.dev/packages/freezed) for Code Generation
* [mocktail](https://pub.dev/packages/mocktail) and [bloc_test](https://pub.dev/packages/bloc_test) for unit testing

## Screenshots

| Breeds | Breed details | Search |
|:---:|:---:|:---:|
| ![](./assets/screenshots/breeds.jpg) | ![](./assets/screenshots/breed_details.jpg) | ![](./assets/screenshots/search.jpg) |
| Favorites | Voting | Video |
| ![](./assets/screenshots/favorites.jpg) | ![](./assets/screenshots/voting.jpg) | |


<table>
  <thead>
    <tr>
      <th width="500px">Breeds</th>
      <th width="500px">Breed details</th>
      <th width="500px">Search</th>
    </tr>
  </thead>
  <tbody>
    <tr width="600px">
      <td>
        <image src="./assets/screenshots/breeds.jpg" />
      </td>
      <td>
        <image src="./assets/screenshots/breed_details.jpg" />
      </td>
      <td>
        <image src="./assets/screenshots/search.jpg" />
      </td>
    </tr>
    <tr width="600px">
      <th width="500px">Favorites</th>
      <th width="500px">Voting</th>
      <th width="500px">Video</th>
    </tr>
    <tr width="600px">
      <td>
        <image src="./assets/screenshots/favorites.jpg" />
      </td>
      <td>
        <image src="./assets/screenshots/voting.jpg" />
      </td>
      <td>
<!--          <video src="https://github.com/4lfant/flutter_demo_app/assets/13089900/5356f5d7-730b-4aca-97a6-5d72c8fd4fec" /> -->
      </td>
    </tr>
  </tbody>
</table>







