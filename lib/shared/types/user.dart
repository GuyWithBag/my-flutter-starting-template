// Used for placeholder data (https://jsonplaceholder.typicode.com/)

class User {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  User(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  // User(this.userId, this.id, this.title, this.completed);
}
