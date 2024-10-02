import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:very_good_coffee_app/modules/home/views/screens/favorites_index.dart';

class FavButtonWidget extends StatelessWidget {
  const FavButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(FavoritesIndex.routeName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.redAccent, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.redAccent.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            SizedBox(width: 8),
            Text(
              "Favorites",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              
            ),
            Icon(
              Icons.favorite,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
