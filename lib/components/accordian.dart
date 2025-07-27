import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;

  const Accordion({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  // Show or hide the content
  bool _showContent = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // The title
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: secondColor,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                  _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onPressed: () {
                setState(() {
                  _showContent = !_showContent;
                });
              },
            ),
          ),
          // Show or hide the content based on the state
          !_showContent
              ? Container()
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: HtmlWidget(
                    widget.content,
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
