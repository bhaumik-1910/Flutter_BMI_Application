import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('BMI Application')),//Body mass index
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [
                Color(0xffffecd2),Color(0xfffcb69f)
                // Colors.orange.shade300,
                // Colors.purple.shade300,
                // Colors.brown.shade300
              ],
            center: Alignment.center,
            stops: [0.0,1.0],
          )
        ),
        // color: bgColor,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter the Weight(in Kgs)',style: TextStyle(fontSize: 20),),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),

                SizedBox(height: 21,),

                TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter the Height(in Feet)',style: TextStyle(fontSize: 20),),
                      prefixIcon: Icon(Icons.height),
                  ),
                ),

                SizedBox(height: 11,),

                TextField(
                  keyboardType: TextInputType.number,
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter the Height(in Inch)',style: TextStyle(fontSize: 20),),
                      prefixIcon: Icon(Icons.height),
                  ),
                ),

                SizedBox(height: 11,),

                ElevatedButton(onPressed: () {

                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt != "" && ft != "" && inch != ""){

                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt*12) + iInch;
                      var tCm = tInch*2.54;
                      var tM = tCm/100;

                      var bmi = iWt/(tM*tM);

                      var msg = "";
                      if(bmi>25){
                        msg = "You are OverWeight!!";
                        bgColor = Colors.orange;
                      }else if(bmi<18){
                        msg = "You are UnderWeight!!";
                        bgColor = Colors.red;
                      }else{
                        msg = "You are Healthy!!";
                        bgColor = Colors.green;
                      }

                      setState(() {
                        result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                      });

                    }else{
                      setState(() {
                        result = "Please fill all the required blanks!!";
                      });
                    }

                },
                  child: Text('Calculate',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),

                SizedBox(height: 11,),

                Text(result,style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




//--------------------- BMI APP [Body mass index]-------------------------






//--------------------- Add a Flutter Range Slider-------------------------
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   RangeValues values = RangeValues(0, 100);
//
//   @override
//   Widget build(BuildContext context) {
//
//     RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text('Range Sider Demo'),
//       ),
//       body: Center(
//         child: RangeSlider(
//           values: values,
//           labels: labels,
//           divisions: 10,
//           activeColor: Colors.green,
//           inactiveColor: Colors.green.shade100,
//           min: 0,
//           max: 100,
//           onChanged: (newValue){
//             values = newValue;
//             // print('$newValue');
//             print('${newValue.start},${newValue.end}');
//             setState(() {});
//           },
//         ),
//       ),
//     );
//   }
// }
