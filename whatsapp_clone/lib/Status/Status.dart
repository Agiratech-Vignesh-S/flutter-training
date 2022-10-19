import 'package:flutter/material.dart';
import 'package:whatsapp_clone/img1.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    onTap: () {},
                    leading: Stack(alignment: Alignment.bottomRight, children: [
                      Container(
                        child: ClipRRect(
                          child: Image.asset('assets/images/img.jpg'),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ]),
                    title: const Text(
                      "My status",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text("Tap to add Status update"),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 40,
              width: double.infinity,
              child: Text("Recent updates"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => img1()));
                    },
                    leading: FittedBox(
                      child: Container(
                          padding: EdgeInsets.all(1.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(47),
                              border:
                                  Border.all(color: Colors.green, width: 3)),
                          width: 100,
                          height: 100,
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/sun.jpg'),
                          )),
                    ),
                    title: const Text(
                      "Ram",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text("Today. 3:11 pm"),
                  ),
                ),
                const Divider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => img1()));
                    },
                    leading: FittedBox(
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 3),
                            borderRadius: BorderRadius.circular(47),
                          ),
                          padding: EdgeInsets.all(1.5),
                          width: 100,
                          height: 100,
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/flower.jpg'),
                          )),
                    ),
                    title: const Text(
                      "Raja",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text("Today. 4:11 pm"),
                  ),
                ),
                const Divider(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            mini: true,
            onPressed: () {
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.edit,
              color: Colors.black54,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            backgroundColor: Colors.green,
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
