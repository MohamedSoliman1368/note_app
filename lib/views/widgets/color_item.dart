import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/constants.dart';

import '../../cubits/cubit_add_note/add_note_cubit.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: CircleAvatar(radius: 22, backgroundColor: color),
        )
        : CircleAvatar(radius: 25, backgroundColor: color);
  }
}

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                setState(() {});
              },
              child: ColorsItem(isSelected: currentIndex == index, color: kColors[index]),
            ),
          );
        },
      ),
    );
  }
}
