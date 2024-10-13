import 'package:flutter/material.dart';

class Everydaynewssearchbar extends StatefulWidget {
  const Everydaynewssearchbar({super.key});

  @override
  State<Everydaynewssearchbar> createState() => _EverydaynewssearchbarState();
}

class _EverydaynewssearchbarState extends State<Everydaynewssearchbar> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded( // Wrap the TextField in an Expanded widget
                      child: Container(
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search...',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50, // Ensure the container has the same height
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent, // Change the color to match the TextField
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.search, color: Colors.black),
                        onPressed: () {
                          // Add your search action here
                        },
                      ),
                    ),
                  ],
                ),
              );
  }
}