validatePhone({required String? phone}) {
  if (phone == null || phone.isEmpty) {
    return "Phone number is required";
  }
  if (phone.length != 10) {
    return "Phone number must be 10 digits";
  }
  return null;
}