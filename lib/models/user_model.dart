class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

final User currentUser = User(
  id: 0,
  name: 'Eduard',
  imageUrl: 'assets/alone.jpg',
  isOnline: true,
);

final User QuadratoTeam = User(
  id: 1,
  name: 'Quadrato Team',
  imageUrl: 'assets/flower.jpg',
  isOnline: true,
);

final User Joyce = User(
  id: 2,
  name: 'Joyce',
  imageUrl: 'assets/mountain.jpg',
  isOnline: false,
);

final User yasinulH = User(
  id: 3,
  name: 'yasinul H',
  imageUrl: 'assets/smile.png',
  isOnline: false,
);
final User axyter = User(
  id: 4,
  name: 'axyter',
  imageUrl: 'assets/attractive.jpg',
  isOnline: true,
);
final User shShakill = User(
  id: 5,
  name: 'SH Shakill',
  imageUrl: 'assets/girl.jpg',
  isOnline: false,
);

final User markDev = User(
  id: 5,
  name: 'mark Dev',
  imageUrl: 'assets/alone.jpg',
  isOnline: false,
);
