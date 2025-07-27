import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/widgets/floatingButton.dart';

class PrepareSelectImageScreen extends StatelessWidget {
  const PrepareSelectImageScreen({
    Key? key,
    required this.function,
    required this.textButton,
    required this.icon,
  }) : super(key: key);
  final function;
  final IconData? icon;
  final textButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-rice1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.grey.shade400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/icons/image-processing.png",
                      width: 120,
                    ),
                  ),
                  Text(
                    "ไม่พบรูปภาพ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Text(
                  "โปรด$textButtonเพื่อตรวจโรคข้าว",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          size: 36,
                        ),
                        SizedBox(width: 10),
                        Text(
                          textButton,
                          style: TextStyle(
                            fontFamily: 'NotoSansThai',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: firstColor,
                      textStyle: const TextStyle(fontSize: 18),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ),
                    ),
                    onPressed: function,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
