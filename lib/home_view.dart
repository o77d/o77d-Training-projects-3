import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:training_projects_3/components/drink.dart';
import 'package:training_projects_3/drink_detalis.dart';
import 'package:training_projects_3/model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Gap(50),

            //drink
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: DrinkModel.drinks.length,
                itemBuilder: (context, index) {
                  final drink = DrinkModel.drinks[index];
                  return AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double offset = 0;
                      if (controller.hasClients) {
                        offset = controller.offset / 180 - index;
                      }

                      offset = offset.clamp(0, 1);

                      return Transform.scale(
                        scale: 1 - (offset * 0.2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => DrinkDetalis(),
                              ),
                            );
                          },
                          child: Drink(
                            name: drink.name,
                            title: drink.title,
                            price: drink.price,
                            image: drink.image,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
