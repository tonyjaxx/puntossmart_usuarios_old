import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ScrollingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  ScrollingText({
    required this.text,
    required this.style,
    this.duration = const Duration(seconds: 10),
  });

  @override
  _ScrollingTextState createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _textWidth = 0;
  double _containerWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.addListener(() {
      setState(() {});
    });

    // Inicializa la animación
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measureText();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _containerWidth = constraints.maxWidth;
        return Stack(
          children: [
            if (_textWidth > 0) // Verifica si _textWidth está inicializado
              Positioned(
                left: -(_animation.value) % (_textWidth + _containerWidth) +
                    _containerWidth,
                child: _buildText(),
              ),
            if (_textWidth > 0) // Verifica si _textWidth está inicializado
              Positioned(
                left: _containerWidth -
                    (_animation.value) % (_textWidth + _containerWidth),
                child: _buildText(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildText() {
    return Text(
      widget.text,
      style: widget.style,
      maxLines: 1,
      overflow: TextOverflow.visible,
      softWrap: false,
    );
  }

  void _measureText() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final textPainter = TextPainter(
        text: TextSpan(text: widget.text, style: widget.style),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();
      setState(() {
        _textWidth = textPainter.width;
        _animation = Tween<double>(begin: 0, end: _textWidth + _containerWidth)
            .animate(_controller);
        _controller.repeat();
      });
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Scrolling Text Example')),
        body: Center(
          child: Container(
            width: 300,
            height: 50,
            child: ScrollingText(
              text: 'Some sample text that takes some space.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
