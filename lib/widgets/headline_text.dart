import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                    
                          children: [
                            Text("Hi, Marina",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily:"RobotoMono",
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                            ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/1.5,
                            child: const Text("let's select your perfect place",
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily:"RobotoMono",
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 72, 71, 71),
                              ),
                              ),
                          ),
                          ],
                        ),
                      ],
                    ),
                  );
  }
}