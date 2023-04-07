import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/categories-meals/meal-detail';

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final imageUrl = routeArgs['imageUrl'];
    final ingredients = routeArgs['ingredients'];
    final steps = routeArgs['steps'];

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container(
          width: double.infinity,
          child: ListView(
            children: [
              Image.network(
                imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Robotoco',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Colors.black87,
                        )),
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          ...ingredients.map((ingredient) {
                            return ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              child: Container(
                                color: Colors.amber,
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  ingredient,
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Steps",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Robotoco',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Colors.black87,
                        )),
                    child: Container(
                        height: 200,
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemBuilder: (ctx, index) => Container(
                              margin: EdgeInsets.all(5),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  child: Text(
                                    '# ${index}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  backgroundColor: Colors.pink,
                                ),
                                title: Text(steps[index],
                                    style: TextStyle(fontSize: 20)),
                              )),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
