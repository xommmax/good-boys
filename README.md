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
<table>
  <thead>
    <tr>
      <th width="280px">Breeds</th>
      <th width="280px">Breed details</th>
      <th width="280px">Search</th>
    </tr>
  </thead>
  <tbody>
    <tr>
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
    <tr>
      <th width="280px">Favorites</th>
      <th width="280px">Voting</th>
      <th width="280px">Video</th>
    </tr>
    <tr>
      <td>
        <image src="./assets/screenshots/favorites.jpg" />
      </td>
      <td>
        <image src="./assets/screenshots/voting.jpg" />
      </td>
      <td>
         <video src="https://github.com/4lfant/flutter_demo_app/assets/13089900/34edcca1-49ef-427c-983b-379c70f2f49f" />
      </td>
    </tr>
  </tbody>
</table>







