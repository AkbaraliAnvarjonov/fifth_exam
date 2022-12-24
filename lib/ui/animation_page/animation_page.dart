import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool pageChange = true;
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageChange ? "Animations" : "Paint"),
        actions: [
          IconButton(
              onPressed: () {
                pageChange = !pageChange;
                color = Colors.grey;
                setState(() {});
              },
              icon: const Icon(Icons.change_circle))
        ],
      ),
      body: Center(
        child: pageChange
            ? TweenAnimationBuilder(
                onEnd: () {
                  setState(() {
                    color = Colors.green;
                  });
                },
                duration: const Duration(seconds: 5),
                tween: Tween(begin: 0.0, end: 1),
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            backgroundColor: Colors.grey,
                            strokeWidth: 8,
                            value: value.toDouble(),
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.done,
                          size: 50,
                          color: color,
                        ),
                      )
                    ],
                  );
                },
              )
            : Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 33, 212, 39),
                  Color.fromARGB(255, 103, 202, 106),
                  Color.fromARGB(255, 10, 245, 17),
                  Color.fromARGB(255, 103, 202, 106),
                ])),
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height),
                  painter: MyPainter(),
                ),
              ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;

    Path path = Path();

    path.lineTo(0, size.height * 0.5);

    path.cubicTo(
      size.width * 0.4,
      size.height * 0.2,
      size.width * 0.4,
      size.height * 0.6,
      size.width,
      size.height * 0.5,
    );

    path.lineTo(size.width, 0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
