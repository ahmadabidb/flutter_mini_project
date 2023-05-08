// models/workout.dart

class Workout {
  final String title;
  final String imagePath;
  final String description;

  Workout(this.title, this.imagePath, this.description);
}

final List<Workout> workouts = [
  Workout(
    'Cardio',
    'assets/images/cardio.jpg',
    'Olahraga kardio atau yang disebut sebagai kardiovaskular merupakan serangkaian aktivitas fisik yang dapat membantu meningkatkan kekuatan jantung dan paru-paru.\n Sehingga selama melakukan kardio, organ pernapasan seseorang akan dilatih untuk bernapas lebih cepat dan dalam. Dampaknya, kadar oksigen di dalam darah akan meningkat dan sangat membantu seseorang untuk dapat memanfaatkan oksigen secara efisien dan maksimal. \n Contoh : Jumping jacks, Squat jump, Burpees, Plyo lunges',
  ),
  Workout(
    'Strength Training',
    'assets/images/strength_training.png',
    'Strength training atau latihan kekuatan otot merupakan salah satu regimen olahraga yang cukup populer dikalangan para pecinta fitness. ',
  ),
  Workout(
    'Yoga',
    'assets/images/yoga.jpg',
    'Yoga adalah olahraga yang mengombinasikan antara pikiran dan tubuh. Olahraga ini telah dilakukan sejak 5.000 tahun lalu dalam filosofi India kuno. Berbagai gaya yoga menggabungkan postur fisik, teknik pernapasan, dan meditasi atau relaksasi. ',
  ),
];
