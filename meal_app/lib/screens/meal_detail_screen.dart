import 'package:flutter/material.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/categories-meals/meal-detail';
  Function updateFavorList;
  List<String> FavorListIds;

  MealDetailScreen(this.updateFavorList, this.FavorListIds);

  @override
  MealDetailScreenState createState() => MealDetailScreenState();
}

class MealDetailScreenState extends State<MealDetailScreen> {
  bool isFavored = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    if (widget.FavorListIds.contains(id)) {
      isFavored = true;
    }
  }

  void updateFavor(id) {
    setState(() {
      isFavored = !isFavored;
    });
    widget.updateFavorList(isFavored ? "Like" : "UnLike", id);
  }

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
        floatingActionButton: FloatingActionButton(
          onPressed: () => updateFavor(id),
          child: isFavored
              ? Icon(
                  Icons.star,
                  color: Colors.black,
                )
              : Icon(Icons.star_border),
        ),
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
                height: 20,
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
                      ),
                    ),
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
                          itemBuilder: (ctx, index) {
                            return Container(
                                margin: EdgeInsets.all(5),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    child: Text(
                                      '# ${index + 1}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    backgroundColor: Colors.pink,
                                  ),
                                  title: Text(steps[index],
                                      style: TextStyle(fontSize: 20)),
                                ));
                          },
                          itemCount: steps.length,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
