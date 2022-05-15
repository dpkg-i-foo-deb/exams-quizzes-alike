//The base class, it contains the different types of items a list can contain
import 'package:flutter/material.dart';

abstract class GridItem {
  Widget buildItem(BuildContext context);
}
