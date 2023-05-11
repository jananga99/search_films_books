# Meraxes FT

This is a personal app developed for movie and TV series enthusiasts. We created this app to help us search for our favorite movies and TV series with ease. We believe in making movie and TV series search more fun and enjoyable.

## Requirements

- Flutter version 3.7.12 or later. You can download the latest version of Flutter from the [Flutter website](https://flutter.dev/docs/get-started/install).
- A valid access token from [TMDB](https://www.themoviedb.org/). You can find instructions for obtaining an access token [here](https://www.themoviedb.org/settings/api).

## Development Setup

### Configuration

Create a `.env` file with the following contents at the root:    
`API_AUTHORITY_URL=api.themoviedb.org`          
`API_MOVIE_SEARCH=/3/search/movie`            
`API_TV_SEARCH=/3/search/tv`             
`BEARER_TOKEN=your-access-token-goes-here`            
`IMAGE_URL=https://image.tmdb.org/t/p/original`  `           

To run the app in development mode, follow these steps:

1. Clone the repository: `git clone https://github.com/jananga99/search_films_books.git`
2. Navigate to the project directory: `cd search_films_books`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`

## Creating a Production Build

To create a production build of the app, follow these steps:

1. Navigate to the project directory: `cd search_films_books`
2. Build the app for your desired platform (Android):
    - Android: `flutter build apk`
3. The built app will be located in the `build/app/outputs` directory.


## TMDB (The Movies Database) API Attribution

We use the TMDB API to power our app. The TMDB API is an amazing resource for movie and TV series information. We acknowledge and appreciate their efforts to provide this API to developers like us.

### Attribution Requirements

In accordance with the TMDB API terms of use, we have included the TMDB logo to identify our use of the TMDB API. We have also included a notice to inform our users that this app uses the TMDB API, but is not endorsed or certified by TMDB. We understand and acknowledge that our use of the TMDB logo must be less prominent than our own app logo.

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](https://github.com/jananga99/search_films_books/blob/readme/LICENSE) file for details.

