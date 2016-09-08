# Default Assignee
Redmine iş kayıtlarında belirli bir 'durum' seçildiğinde atanan bölümünün eklenti ayarlarında belirtilmiş kullanıcı seçilecek şekilde değişmesini sağlar.
Redmine v3 uyumludur.

## Özellikleri
1. Öntanımlı ayar kaydedilebilir.
2. Her proje için etkin/pasif edilebilir.
3. Her proje için ayrı ayar kaydedilebilir.

## Ayarlar
* Proje bazlı eklenti ayarlarına yönetici hesabı ile proje seçildikten sonra /settings/plugin/redmine_default_assignee adresinden ulaşılabilir.
* Ayar ekranında 'durum'ların bir listesi görünür. Her bir 'durum'un karşısındaki menüden durumu seçince tetiklenecek kullanıcı seçilebilir.
* Tüm projeler için öntanımlı bir ayar yapılmak istenirse yönetici hesabı ile /administration/Plugins/redmine_default_assignee configure ile ‘durum’un karşısındaki menüden durum atananı seçilir.

Not: Bu eklentinin gözükmesi için projenin 'Ayarlar' bağlantısında bulunan ‘Modüller' sekmesinde ‘Default Assignee’ etkin olmalıdır.
