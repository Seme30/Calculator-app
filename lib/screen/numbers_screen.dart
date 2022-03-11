import 'package:flutter/material.dart';

class NumbersScreen extends StatelessWidget {
  final List<String> numbers;
  final Function getSelectedNumber;

  NumbersScreen(this.numbers, this.getSelectedNumber);

  @override
  Widget build(BuildContext context) {
    double media = (MediaQuery.of(context).size.height) * 0.72;
    return Container(
      height: media,
      child: Card(
        child: Center(
          child: GridView(
            // padding: const EdgeInsets.symmetric(horizontal: 15),
            children: numbers.map((e) {
              return (Column(children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      child: Text(e),
                      onPressed: () {
                        getSelectedNumber(e.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // )
              ]));
            }).toList(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 80,
              // childAspectRatio: 3 / 2,
              // crossAxisSpacing: 5,
            ),
          ),
        ),
      ),
    );
  }
}
