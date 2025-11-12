# siuuu_store

Tugas 7

*Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget Tree adalah struktur hierarkis dari semua widget yang saling bersarang yang membentuk UI aplikasi Flutter. Dalam hubungan induk-anak, widget parent bertugas memberikan batasan ukuran (constraints) dan menentukan posisi, sementara widget anak child bertanggung jawab untuk menentukan ukurannya sendiri di dalam batasan yang telah diberikan tersebut.

*Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    -MaterialApp: Widget root (akar) dari aplikasi. Ini mengatur tema (ThemeData), navigation (navigasi), dan widget home (halaman utama) untuk aplikasi.
    -Scaffold: Menyediakan kerangka dasar untuk halaman. Dalam proyek ini, Scaffold digunakan di MyHomePage untuk memberikan AppBar (bilah atas) dan body (konten utama halaman).
    -AppBar: Bilah yang muncul di bagian atas Scaffold. Kamu menggunakannya untuk menampilkan judul "SIUUU STORE".
    -Column: Widget layout yang menyusun children (anak-anaknya) secara vertikal. Kamu menggunakannya di MyHomePage untuk menyusun Row (InfoCard), Text (Selamat datang), dan GridView dari atas ke bawah.
    -Row: Widget layout yang menyusun children-nya secara horizontal. Kamu menggunakannya untuk menampilkan tiga InfoCard (NPM, Nama, Kelas) secara berdampingan.
    -Padding: Memberikan ruang kosong (bantalan) di sekeliling child-nya. Kamu menggunakannya untuk memberi jarak 16.0 di sekeliling body utama Scaffold.
    -SizedBox: Sebuah kotak dengan ukuran tertentu. Kamu menggunakannya untuk memberi jarak vertikal (ketinggian 16.0) antara Row InfoCard dan Center di bawahnya.
    -Center: Widget yang memposisikan child-nya di tengah.
    -Text: Digunakan untuk menampilkan teks, seperti judul di AppBar, label di InfoCard ("NPM", "Name", "Class"), dan nama item di ItemCard.
    -GridView.count: Menampilkan children-nya dalam bentuk grid (kisi) yang bisa di-scroll. Kamu menggunakannya untuk menampilkan tiga ItemCard dalam 3 kolom.
    -Card: Widget dari Material Design yang menampilkan kotak dengan sedikit bayangan (elevasi). Kamu menggunakannya di dalam InfoCard sebagai latar belakang.
    -Container: Widget serbaguna untuk tata letak, styling, dan ukuran. Kamu menggunakannya di InfoCard untuk mengatur lebar dan padding, serta di ItemCard untuk memberi padding.
    -Material & InkWell: Digunakan bersamaan di ItemCard. Material memberi warna latar belakang dan bentuk, sementara InkWell mendeteksi ketukan (onTap) dan memberikan efek "splash" (riak air) saat ditekan.
    -Icon: Menampilkan ikon grafis. Kamu menggunakannya di dalam ItemCard untuk menampilkan Icons.store, Icons.inventory_2, dan Icons.add.
    -ScaffoldMessenger & SnackBar: Digunakan di dalam onTap pada ItemCard. ScaffoldMessenger mengelola SnackBar (pesan sementara) yang muncul di bagian bawah layar saat item ditekan.
    -Widget Kustom (MyApp, MyHomePage, InfoCard, ItemCard): Ini adalah StatelessWidget yang kamu buat sendiri untuk merapikan kode dan membuat UI yang reusable (dapat digunakan kembali).

*Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    -Mengatur Tema (Theme): Menyediakan ThemeData (seperti colorScheme yang kamu atur) yang akan diwariskan ke semua widget di bawahnya. Inilah mengapa AppBar kamu bisa otomatis berwarna biru (primary) tanpa diatur manual.
    -Manajemen Navigasi (Routes): Mengatur tumpukan navigasi, memungkinkan kita berpindah antar halaman (layar) menggunakan Navigator.
    -Menentukan Halaman Awal (Home): Menetapkan widget mana yang akan ditampilkan pertama kali saat aplikasi dibuka melalui properti home.
karena widget ini menyediakan konteks fundamental (seperti ThemeData, NavigatorState, MediaQuery) yang dibutuhkan oleh hampir semua widget Material Design lainnya. Tanpa MaterialApp di puncaknya, widget seperti Scaffold, AppBar, Card, dan Navigator tidak akan berfungsi dengan benar.

*Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget bersifat statis, artinya tampilannya tidak berubah setelah dibuat, sehingga cocok untuk UI seperti ikon atau teks, sedangkan StatefulWidget dapat mengubah tampilannya secara dinamis selama runtime sebagai respons terhadap interaksi pengguna atau data baru, sehingga cocok untuk form atau counter.

*Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah sebuah "lokator" yang memberi tahu sebuah widget di mana tepatnya ia berada di dalam widget tree dan berfungsi sebagai penghubung ke widget-widget di atasnya. BuildContext sangat penting dalam metode build karena digunakan untuk mengambil data yang diwariskan dari ancestor, seperti tema aplikasi (Theme.of(context)) atau ukuran layar (MediaQuery.of(context)), serta untuk mengakses service global seperti ScaffoldMessenger.of(context).

*Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
"Hot Reload" memasukkan kode baru ke dalam aplikasi yang sedang berjalan dan membangun ulang UI tanpa menghilangkan state saat ini, sehingga ideal untuk perubahan visual atau logika yang cepat. Sebaliknya, "Hot Restart" memulai ulang seluruh aplikasi, menghancurkan state yang ada, dan ini diperlukan ketika ada perubahan besar seperti pada state global atau file main().

Tugas 8

*Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push() menambahkan halaman baru di atas tumpukan (stack) navigasi, sehingga pengguna bisa menekan tombol "kembali" untuk kembali ke halaman sebelumnya. Sebaliknya, Navigator.pushReplacement() mengganti halaman saat ini dengan yang baru, menghapus halaman lama dari tumpukan, sehingga pengguna tidak bisa kembali ke halaman yang digantinya. Pada aplikasi saya, pushReplacement() digunakan di LeftDrawer untuk berpindah antar menu utama (Home, Tambah Produk) agar tidak menumpuk riwayat halaman, sementara push() (seperti di item_card.dart) ideal untuk aksi yang bersifat sementara, seperti membuka form di atas menu utama, di mana pengguna diharapkan bisa "kembali".
*Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Memanfaatkan Scaffold sebagai kerangka dasar (struktur visual) untuk setiap halaman, seperti MyHomePage dan ItemFormPage. Dengan menempatkan AppBar dan LeftDrawer di dalam properti appBar dan drawer milik Scaffold, saya memastikan bahwa bagian judul atas dan menu navigasi samping muncul secara konsisten di seluruh halaman. Hirarki ini memisahkan struktur utama halaman dari konten spesifik di dalam body, menciptakan user experience yang seragam dan mudah dinavigasi.

*Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    -SingleChildScrollView: Widget ini sangat krusial pada ItemFormPage karena membungkus Column yang berisi banyak TextFormField. Ini memastikan bahwa ketika keyboard virtual muncul atau saat aplikasi dibuka di layar yang lebih kecil, pengguna tetap dapat scroll ke bawah untuk mengakses semua field form, sehingga menghindari pixel overflow error yang umum terjadi.

    -Padding: Seperti yang terlihat di itemlist_form.dart, Padding digunakan untuk membungkus setiap TextFormField. Ini memberikan "ruang bernapas" (spasi) di sekitar elemen input, membuat form terlihat lebih rapi, tidak sesak, dan lebih mudah dibaca oleh pengguna.

*Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk menciptakan identitas visual yang konsisten adalah dengan mendefinisikan skema warna brand (misalnya, primaryColor, secondaryColor) secara terpusat di dalam ThemeData pada MaterialApp. Setelah itu dapat mengakses warna-warna ini di seluruh aplikasi menggunakan Theme.of(context).colorScheme.primary atau Theme.of(context).colorScheme.secondary