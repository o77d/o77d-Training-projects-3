import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:training_projects_3/components/qty_widget.dart';
import 'package:training_projects_3/components/toggle_widget.dart';
import 'package:training_projects_3/model.dart';

class DrinkDetalis extends StatefulWidget {
  const DrinkDetalis({super.key});

  @override
  State<DrinkDetalis> createState() => _DrinkDetalisState();
}

class _DrinkDetalisState extends State<DrinkDetalis> {
  final PageController _controller = PageController(viewportFraction: 0.50);

  double _currentPage = 0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 1;
      });
    });
    super.initState();
  }

  //logic

  int selectedIndex = 0;

  // model

  final drinks = DrinkModel.drinks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //2 wid
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      drinks[_currentPage.round()].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(drinks[_currentPage.round()].title),
                  ],
                ),
                Text(
                  drinks[_currentPage.round()].price,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),

          //2 wid
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              final scale = 1 - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 400;

              return Transform.translate(
                offset: Offset(translateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            drinks[index].image,
                            height: 860,
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            bottom: 230,
                            left: 0,
                            right: 0,

                            child: Container(
                              width: 70,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87,
                                    blurRadius: 80,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          //3wid
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black87),
                            color: selectedIndex == index
                                ? Colors.grey
                                : Colors.white,
                          ),

                          child: Icon(
                            Icons.abc_outlined,
                            color: Colors.black54,
                          ),
                        ),
                      );
                    }),
                  ),

                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ToggleWidget(),
                      Gap(20),
                      Expanded(child: QtyWidget()),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // wid 4
        ],
      ),
    );
  }
}
