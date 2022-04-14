abstract class ApiRoutes {
  // auth routes
  static const _baseUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:';
  static const _keyAPI = 'AIzaSyCXSIKy6HNThvQn6aBju7mR76tgSeTRa3A';
  static const signUp = _baseUrl + 'signUp?key=' + _keyAPI;
  static const signIn = _baseUrl + 'signInWithPassword?key=' + _keyAPI;
  // other routes
  static const memes =
      'https://console.firebase.google.com/u/0/project/meme-creator-2dbfb/database/meme-creator-2dbfb-default-rtdb/data/~2F';
}
