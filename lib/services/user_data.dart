class UserDataService {
  String getInitials(String name) {
    return name
        .split(' ')
        .map((word) => word.isNotEmpty ? word[0] : '')
        .take(2)
        .join();
  }
}
