import 'package:flutter/material.dart';
import 'package:myislamicdream/utils/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 58,
              ),
              Text(
                "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                onChanged: (value) {},
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'what was your dream about ',
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: color_primary,
                  ),
                  // icon:
                  hintStyle: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Search Now →',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(color_secondary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Divider(
                height: 10,
                color: Colors.black54,
              ),
              Image.asset(
                'asset/images/myislamicdream_logo.png',
                height: 95,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
