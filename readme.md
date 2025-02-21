# Tutorial 2
## Latihan: Playtest
### Apa saja pesan log yang dicetak pada panel Output?
Di awal program tersebut di-_play_, maka terdapat pesan log `Platform initialized`.

### Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?
Selain pesan `Platform initialized` di awal program tersebut di-_play_, maka akan tercetak pesan `Reached objective!` setiap kali BlueShip menyentuh hampir batas atas.

### Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?
Ya, hal tersebut berkaitan. Setiap kali BlueShip mencapai area `CollisionShape2D` atau biru kotak di tampilan 2d, maka akan tercetak pesan log `Reached objective!`.

## Latihan: Memanipulasi Node dan Scene
### Scene BlueShip dan StonePlatform sama-sama memiliki sebuah child node bertipe Sprite. Apa fungsi dari node bertipe Sprite?
node bertipe Sprite digunakan untuk menampilkan gambar (tekstur) dalam 2D

### Root node dari scene BlueShip dan StonePlatform menggunakan tipe yang berbeda. BlueShip menggunakan tipe RigidBody2D, sedangkan StonePlatform menggunakan tipe StaticBody2D. Apa perbedaan dari masing-masing tipe node?
1. RigidBody2D (BlueShip)
    * Berperilaku seperti objek fisika nyata dalam dunia 2D.
    * Dipengaruhi oleh gaya (force), impuls (impulse), gravitasi, dan tumbukan dengan objek lain.
2.  StaticBody2D (StonePlatform)
    * Tidak bergerak dan tidak dipengaruhi oleh fisika.
    * Digunakan untuk objek yang diam dan hanya berfungsi sebagai penghalang atau tempat bertumpu.

### Ubah nilai atribut Mass pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?
Tidak berpengaruh apapun. Karena massa tidak memengaruhi gerak jatuh benda, yang memengaruhi adalah gravitasi

### Ubah nilai atribut Disabled pada tipe CollisionShape2D di scene StonePlatform, lalu coba jalankan scene MainLevel. Apa yang terjadi?
Jika diubah, maka kapal BlueShip akan terjun bebas (tidak tertampung lagi oleh _stone_).

### Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?
Jika mengubah position, maka akan mengubah posisi BlueShip. Jika mengubah rotation, maka akan BlueShip akan berputar posisinya. Jika mengubah scale, BlueShip akan bertambah besar atau mengecil.

### Pada scene MainLevel, perhatikan nilai atribut Position node PlatformBlue, StonePlatform, dan StonePlatform2. Mengapa nilai Position node StonePlatform dan StonePlatform2 tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?
Hal tersebut karena StonePlatform dan StonePlatform2 memiliki koordinat relatif terhadap parent (PlatformBlue), bukan terhadap scene global. 