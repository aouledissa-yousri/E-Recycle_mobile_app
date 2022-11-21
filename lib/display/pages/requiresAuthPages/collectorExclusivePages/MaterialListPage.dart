import 'package:flutter/material.dart';


class MaterialListPage extends StatefulWidget {
  const MaterialListPage({super.key});

  @override
  State<MaterialListPage> createState() => _MaterialListPageState();
}

class _MaterialListPageState extends State<MaterialListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Material list")
    );
  }
}