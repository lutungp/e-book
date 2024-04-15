class BookList {
  String imageUrl;
  String writers;
  String title;

  BookList({
    required this.imageUrl,
    required this.writers,
    required this.title,
  });
}

List<BookList> bookLists = [
  BookList(
    imageUrl: 'assets/images/trending-book-1.png',
    writers: 'Guy Kawasaki',
    title: 'Enchantment',
  ),
  BookList(
    imageUrl: 'assets/images/trending-book-2.png',
    writers: 'Aarn Mahnke',
    title: 'Lore',
  ),
  BookList(
    imageUrl: 'assets/images/trending-book-3.png',
    writers: 'Spencher Johnson, M.D',
    title: 'Who Moved My Cheese',
  )
];
