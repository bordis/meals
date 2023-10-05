import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app-routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    super.key,
    required this.meal,
  });

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          AppRoutes.MEAL_DETAIL,
          arguments: meal,
        )
        .then((value) => {
              if (value != null)
                {
                  print(value),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  // ClipRRect é um widget que permite arredondar as bordas de um widget filho
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  // Positioned é um widget que permite posicionar um widget filho em um local específico
                  bottom: 20,
                  right: 10,
                  child: Container(
                    // Container é um widget que permite definir um tamanho para o widget filho
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true, // Quebra a linha se necessário
                      overflow: TextOverflow.fade, // Faz o texto desaparecer
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                // Row é um widget que permite organizar os widgets filhos em uma linha
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(meal.complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(meal.costText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
