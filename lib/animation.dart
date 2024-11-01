import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ripple extends StatelessWidget {
  const Ripple({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool rippleClicked = false.obs;
    RxBool GoClicked = false.obs;// Reactive variable to track click state
    var size = Get.size; // Get the size of the screen

    return Obx(() => Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center, // Align all children to the center
          children: [
            // Bottom Circle (Black)
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: rippleClicked.value ? size.height * .15 : size.height * .25,
              width: rippleClicked.value ? size.width * .40 : size.width * .5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade500,
              ),
            ),
            // Middle Circle (Gray)
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: rippleClicked.value ? size.height * .15 : size.height * .20,
              width: rippleClicked.value ? size.width * .40 : size.width * .45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey.shade700,
              ),
            ),
            // Top Circle (Ripple Color)
            GestureDetector(
              onTap: () {
                rippleClicked.value = !rippleClicked.value; // Toggle the click state
              },
              child: Container(
                height: size.height * .15,
                width: size.width * .40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black, // Ripple color
                ),
              ),
            ),
            // Show text only when the circle is clicked

            if (!rippleClicked.value)
              Positioned(
                child: GestureDetector(
                  onTap: () {
                    GoClicked.value=!GoClicked.value;
                  },
                  child: Text(
                    'Goo',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w100,
                      color: GoClicked.value?Colors.red.withOpacity(0): Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}