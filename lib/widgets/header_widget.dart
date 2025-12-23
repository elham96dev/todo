
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task_provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();
    return SizedBox(
      height: 360,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120.0),
                  bottomRight: Radius.circular(120.0)
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "Let's do!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  fontFamily: "todo"
                ),
              ),
            )
          ),
          Positioned(
            top: 170 ,
            left: 140,
            child: SizedBox(
              height: 110,
              width: 140,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(
                        "Tasks",
                       style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                        fontFamily: "todo",
                        fontSize: 32
                      ),
                      ),
                       Text(
                        provider.tasks.length.toString(),
                       style: TextStyle(
                        color: Colors.green.shade700,
                        fontFamily: "todo",
                        fontSize: 32
                      ),
                    ),
                  ],
                                      ),
                ),
            ),
          ))
        ],
      ),
    );
  }
}