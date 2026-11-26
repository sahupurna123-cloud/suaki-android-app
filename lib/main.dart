import 'package:flutter/material.dart';
void main() => runApp(const SuakiApp());
const navy = Color(0xFF102A56), blue = Color(0xFF2563EB), pale = Color(0xFFF3F6FC);
class Service {
  final String title, description, category; final int price;
  const Service(this.title, this.description, this.category, this.price);
}
const services = [
 Service('100 EDU Profile Backlinks','Manually created profile backlinks for a diverse backlink profile.','EDU BACKLINKS',1499),
 Service('100 EDU Blog Comment Backlinks','Relevant blog comment links created manually with care.','EDU BACKLINKS',1299),
 Service('High Quality EDU Guest Post','Contextual guest post placement on relevant education websites.','GUEST POSTS',2499),
 Service('Indonesian Country-Level Backlinks','Backlink building focused on Indonesian websites and audiences.','LOCAL SEO',1999),
 Service('100 EDU & GOV Backlinks','A mixed backlink package for a diversified SEO campaign.','BACKLINK PACKAGES',2999),
];
class SuakiApp extends StatefulWidget { const SuakiApp({super.key}); @override State<SuakiApp> createState()=>_SuakiAppState(); }
class _SuakiAppState extends State<SuakiApp> {
 int tab=0; final Map<Service,int> cart={};
 int get count=>cart.values.fold(0,(a,b)=>a+b);
 int get total=>cart.entries.fold(0,(a,e)=>a+e.key.price*e.value);
 void add(Service s)=>setState(()=>cart[s]=(cart[s]??0)+1);
 void change(Service s,int d)=>setState((){final n=(cart[s]??0)+d;if(n<=0){cart.remove(s);}else{cart[s]=n;}});
 @override Widget build(BuildContext context){
  final pages=[home(),cartPage(),accountPage()];
  return MaterialApp(debugShowCheckedModeBanner:false,title:'Suaki',theme:ThemeData(colorScheme:ColorScheme.fromSeed(seedColor:blue),scaffoldBackgroundColor:pale,useMaterial3:true),
   home:Scaffold(body:SafeArea(child:pages[tab]),bottomNavigationBar:NavigationBar(selectedIndex:tab,onDestinationSelected:(v)=>setState(()=>tab=v),destinations:[
    const NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home),label:'Home'),
    NavigationDestination(icon:const Icon(Icons.shopping_bag_outlined),selectedIcon:const Icon(Icons.shopping_bag),label:'Cart (${count})'),
    const NavigationDestination(icon:Icon(Icons.person_outline),selectedIcon:Icon(Icons.person),label:'Account'),
   ])));
 }
 Widget home()=>CustomScrollView(slivers:[
  SliverToBoxAdapter(child:Container(padding:const EdgeInsets.fromLTRB(22,22,22,28),decoration:const BoxDecoration(gradient:LinearGradient(colors:[navy,Color(0xFF2456A6)]),borderRadius:BorderRadius.vertical(bottom:Radius.circular(28))),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   Row(children:[const Icon(Icons.bolt,color:Colors.white,size:30),const SizedBox(width:7),const Text('SUAKI',style:TextStyle(color:Colors.white,fontSize:23,fontWeight:FontWeight.w900,letterSpacing:2)),const Spacer(),IconButton(onPressed:()=>setState(()=>tab=1),icon:const Icon(Icons.shopping_cart_outlined,color:Colors.white))]),
   const SizedBox(height:20),const Text('Grow your website\nwith smarter SEO',style:TextStyle(color:Colors.white,fontSize:29,height:1.15,fontWeight:FontWeight.bold)),
   const SizedBox(height:10),const Text('Explore backlink services built for your SEO goals.',style:TextStyle(color:Color(0xFFDCE8FF),fontSize:14)),
   const SizedBox(height:20),Container(padding:const EdgeInsets.symmetric(horizontal:14,vertical:12),decoration:BoxDecoration(color:Colors.white.withOpacity(.14),borderRadius:BorderRadius.circular(13)),child:const Row(children:[Icon(Icons.verified_user_outlined,color:Colors.white),SizedBox(width:10),Expanded(child:Text('SEO services for website owners and marketers',style:TextStyle(color:Colors.white,fontSize:12)))]))
  ]))),
  SliverToBoxAdapter(child:Padding(padding:const EdgeInsets.fromLTRB(18,22,18,10),child:const Text('Popular services',style:TextStyle(fontSize:21,fontWeight:FontWeight.bold,color:navy)))),
  SliverPadding(padding:const EdgeInsets.fromLTRB(16,0,16,20),sliver:SliverList(delegate:SliverChildBuilderDelegate((context,i)=>serviceCard(services[i]),childCount:services.length))),
  const SliverToBoxAdapter(child:Padding(padding:EdgeInsets.fromLTRB(20,4,20,24),child:Text('Prototype version • Sample services and prices • Live store connection coming in a future release',style:TextStyle(color:Colors.black54,fontSize:11))))
 ]);
 Widget serviceCard(Service s)=>Card(margin:const EdgeInsets.only(bottom:13),elevation:0,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(18),side:const BorderSide(color:Color(0xFFE5EAF3))),child:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
  Row(children:[Container(padding:const EdgeInsets.all(12),decoration:BoxDecoration(color:const Color(0xFFEAF1FF),borderRadius:BorderRadius.circular(13)),child:const Icon(Icons.link,color:blue,size:25)),const SizedBox(width:12),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(s.category,style:const TextStyle(color:blue,fontSize:10,fontWeight:FontWeight.bold,letterSpacing:.8)),const SizedBox(height:4),Text(s.title,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:15,color:navy))]))]),
  const SizedBox(height:12),Text(s.description,style:const TextStyle(color:Colors.black54,height:1.4,fontSize:12)),const SizedBox(height:14),
  Row(children:[Text('₹${s.price}',style:const TextStyle(fontSize:19,color:navy,fontWeight:FontWeight.w800)),const Spacer(),FilledButton.icon(onPressed:()=>add(s),icon:const Icon(Icons.add_shopping_cart,size:17),label:const Text('Add to cart'))])
 ])));
 Widget cartPage() => Padding(
  padding: const EdgeInsets.all(18),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      const Text('Your cart', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: navy)),
      const SizedBox(height: 15),
      if (cart.isEmpty)
        const Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_bag_outlined, size: 58, color: Colors.black26),
                SizedBox(height: 12),
                Text('Your cart is empty', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text('Add a service to get started.', style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        )
      else ...[
        Expanded(
          child: ListView(
            children: cart.entries.map((entry) {
              final service = entry.key;
              final quantity = entry.value;
              return Card(
                elevation: 0,
                child: ListTile(
                  title: Text(service.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('₹${service.price} each'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => change(service, -1),
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text('$quantity'),
                      IconButton(
                        onPressed: () => change(service, 1),
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const Divider(),
        Row(
          children: [
            const Text('Total', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text('₹$total', style: const TextStyle(fontSize: 22, color: navy, fontWeight: FontWeight.w900)),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () => showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: const Text('Demo checkout'),
                content: const Text('This prototype uses sample cart data. Live WooCommerce checkout will be connected in a later version.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
            child: const Text('Continue to checkout'),
          ),
        ),
      ],
    ],
  ),
 );
 Widget accountPage()=>ListView(padding:const EdgeInsets.all(20),children:[
  const SizedBox(height:12),const Text('My account',style:TextStyle(fontSize:26,fontWeight:FontWeight.bold,color:navy)),const SizedBox(height:18),
  Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(color:navy,borderRadius:BorderRadius.circular(18)),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Icon(Icons.account_circle_outlined,color:Colors.white,size:42),SizedBox(height:10),Text('Welcome to Suaki',style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold)),Text('Sign-in and order features will be enabled when the live store API is connected.',style:TextStyle(color:Color(0xFFDCE8FF),height:1.4))])),
  const SizedBox(height:15),accountTile(Icons.receipt_long_outlined,'My orders','Order history will appear here'),accountTile(Icons.favorite_border,'Wishlist','Save your favourite services'),accountTile(Icons.support_agent,'Customer support','Visit suaki.com for assistance'),accountTile(Icons.language,'Visit Suaki website','suaki.com'),
  const SizedBox(height:18),const Center(child:Text('Suaki Android prototype • v1.0.0',style:TextStyle(color:Colors.black45,fontSize:11)))
 ]);
 Widget accountTile(IconData icon,String title,String subtitle)=>Card(elevation:0,child:ListTile(onTap:()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('This feature will be available in a future version.'))),leading:Icon(icon,color:blue),title:Text(title,style:const TextStyle(fontWeight:FontWeight.w600)),subtitle:Text(subtitle),trailing:const Icon(Icons.chevron_right)));
}