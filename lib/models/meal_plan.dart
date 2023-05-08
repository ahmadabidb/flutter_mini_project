class MealPlan {
  final String name, image;
  final double rate, carb;
  final int calorie, fat, protein, weight;
  final bool fav;
  final String description;

  MealPlan(
      {required this.image,
      required this.name,
      required this.fav,
      required this.rate,
      required this.calorie,
      required this.fat,
      required this.weight,
      required this.protein,
      required this.carb,
      required this.description});
}

List<MealPlan> mealPlans = [
  MealPlan(
    image: 'assets/images/oatmeal_yogurt.jpg',
    name: 'Oatmeal Yougurt',
    rate: 4,
    calorie: 166,
    weight: 240,
    fat: 4,
    protein: 6,
    fav: true,
    carb: 28,
    description:
        '1/2 cup oatmeal 1 cup yogurt plain 1/2 cup susu almond 1 buah pisang, potong dadu 1/2 cup buah berry 1/4 cup almond sliced 1 sdm madu (opsional)',
  ),
  MealPlan(
    image: 'assets/images/salad_alpukat.jpg',
    name: 'Salad Alpukat',
    rate: 4,
    calorie: 234,
    weight: 150,
    fat: 21,
    protein: 3,
    fav: true,
    carb: 12,
    description:
        '1 buah alpukat matang 1 buah tomat, potong dadu 1/4 bawang merah, iris tipis 1 sdm jus lemon 1 sdm minyak zaitun Garam dan merica secukupnya Daun selada secukupnya Keju feta secukupnya (opsional)',
  ),
  MealPlan(
    image: 'assets/images/sup_buahbit.jpg',
    name: 'Sup Buah Bit',
    rate: 4,
    calorie: 200,
    weight: 250,
    fat: 2,
    protein: 26,
    fav: true,
    carb: 15,
    description:
        '2 buah bit, kupas kulitnya dan potong dadu kecil 1 buah wortel, kupas dan potong dadu kecil 1 buah bawang bombay, cincang halus 2 siung bawang putih, cincang halus 2 sdm minyak zaitun 3 gelas kaldu ayam 1 sdt garam 1/2 sdt merica hitam 1/2 sdt jintan 1 sdm jus lemon 1 sdm daun seledri cincang',
  ),
  MealPlan(
    image: 'assets/images/salmon_panggang.jpg',
    name: 'Salmon Panggang',
    rate: 4,
    calorie: 121,
    weight: 90,
    fat: 5,
    protein: 17,
    fav: true,
    carb: 0,
    description:
        '2 fillet salmon (ukuran 150-200 gram per fillet) 2 sdm minyak zaitun 2 sdm mustard dijon 1 sdm madu 1/2 sdt paprika bubuk 1/2 sdt bawang putih bubuk 1/2 sdt garam 1/4 sdt merica hitam Lemon wedges untuk penyajian',
  ),
];
