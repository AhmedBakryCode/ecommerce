import 'package:flutter/material.dart';

class TopSearchList extends StatelessWidget {
  final List<String> topSearchItems = [
    'Marketing', 'Programming', 'UX Design', 'Data Science', 'Writing'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: topSearchItems.map((job) => TopSearchItem(job: job)).toList(),
      ),
    );
  }
}

class TopSearchItem extends StatelessWidget {
  final String job;

  TopSearchItem({required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        job,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
