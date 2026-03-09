class CategorizeExpense {

  String call(String store) {

    final name = store.toLowerCase();

    if (name.contains("7-eleven") ||
        name.contains("lotus") ||
        name.contains("tesco")) {
      return "Groceries";
    }

    if (name.contains("starbucks") ||
        name.contains("cafe")) {
      return "Food";
    }

    return "Other";
  }

}