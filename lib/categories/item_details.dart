import '../Const/constants.dart';

class ItemDetails  extends StatelessWidget{
  final String?title;
  const ItemDetails ({Key? key, required this.title}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: title!.text.white.fontFamily(bold).make(),
        backgroundColor: pinkAccent,
        actions:[
          IconButton(onPressed:(){},icon:const Icon(Icons.share)),
      IconButton(onPressed:(){},icon:const Icon(Icons.favorite_outline))
      ],
      ),
      body: Container(
        color:whiteColor, // Grey background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1/3 of the screen for product photo
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Image.asset(
                imgBucket1, // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
            // Details section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wooden Bucket',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 8),
                      Text('4.5 Rating'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$50.00',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                     ElevatedButton(
                    onPressed: () {},

                    child: Text('Offers & Coupons', style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                  ),
                   ElevatedButton(
                    onPressed: () {},

                    child: Text('Easy return before 14 days', style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                  ),
                    ElevatedButton(
                      style: ButtonStyle(
                
                      ),
                    onPressed: () {},
                     
                    child: Text('COD available with other', style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),
                              SizedBox(height: 1,),

              SizedBox(height: 65),
                  Container(
                    height: 60,
                    child:ElevatedButton(
                      
                    onPressed: () {
                      // Handle click on Add to Cart
                      print('Add to Cart');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: pinkAccent,
                      textStyle: TextStyle(
                        fontSize: 20,

                      )

                       // Set the background color to pinkAccent
                    ),
                    child: Text('Add to Cart'),
                  ),)
          ],
        ),
      ),
    );}}