import 'package:flutter/material.dart';
import 'package:flutter_diet_planner/models/meal_plan.dart';
import 'package:flutter_diet_planner/views/screens/meal_plan_detail_screen.dart';

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Meals',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Stay healthy good diet',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: const [
                  Text(
                    'Today meals',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mealPlans.length,
                  itemBuilder: (context, index) {
                    final mealPlan = mealPlans[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MealPlanDetailScreen(mealPlan: mealPlan),
                          ),
                        );
                      },
                      child: Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(mealPlan.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          mealPlan.name,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rounded,
                                            color: Colors.orange,
                                            size: 18,
                                          ),
                                          Text(
                                            mealPlan.rate.toString(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Calorie: ${mealPlan.calorie.toString()}g',
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Fat: ${mealPlan.fat.toString()}g',
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Protein: ${mealPlan.protein.toString()}g',
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Carb: ${mealPlan.carb.toString()}g',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
