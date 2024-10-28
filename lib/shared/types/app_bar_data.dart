class AppBarData {
  final String? leading;
  final String? title;
  final bool centerTitle;
  final bool pinned;

  AppBarData({
    this.leading,
    this.title,
    this.centerTitle = true,
    this.pinned = true,
  });
}
